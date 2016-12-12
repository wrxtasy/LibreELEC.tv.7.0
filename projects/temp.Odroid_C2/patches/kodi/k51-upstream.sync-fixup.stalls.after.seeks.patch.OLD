From 08e0547d6f22df05a12e7548f81bd499e1b54b00 Mon Sep 17 00:00:00 2001
From: "S. Davilla" <davilla@4pi.com>
Date: Sun, 1 May 2016 17:48:46 -0400
Subject: [PATCH] upstream sync, fixup stalls after seeks

---
 xbmc/cores/dvdplayer/DVDPlayerVideo.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xbmc/cores/dvdplayer/DVDPlayerVideo.cpp b/xbmc/cores/dvdplayer/DVDPlayerVideo.cpp
index 3701cd9..85f235d 100644
--- a/xbmc/cores/dvdplayer/DVDPlayerVideo.cpp
+++ b/xbmc/cores/dvdplayer/DVDPlayerVideo.cpp
@@ -1185,7 +1185,8 @@ int CDVDPlayerVideo::OutputPicture(const DVDVideoPicture* src, double pts)
   }
 
   // make sure waiting time is not negative
-  int maxWaitTime = std::max(DVD_TIME_TO_MSEC(iSleepTime) + 500, 50);
+  // and do not stall after seeks
+  int maxWaitTime = std::min(std::max(DVD_TIME_TO_MSEC(iSleepTime) + 500, 50), 500);
   // don't wait when going ff
   if (m_speed > DVD_PLAYSPEED_NORMAL)
     maxWaitTime = std::max(DVD_TIME_TO_MSEC(iSleepTime), 0);
