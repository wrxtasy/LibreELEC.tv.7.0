From 88bac3c7503a70102c816bc4db129481bd361a8c Mon Sep 17 00:00:00 2001
From: Jamie Coldhill <wrxtasy@amnet.net.au>
Date: Mon, 5 Sep 2016 15:49:33 +0800
Subject: [PATCH] Fix-video-rect-calculation-when-using-GUI-scaling-under-Linux

---
 xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.cpp | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.cpp b/xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.cpp
index 04faf56..ca5fa57 100644
--- a/xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.cpp
+++ b/xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.cpp
@@ -2203,11 +2203,7 @@ void CAMLCodec::SetVideoRect(const CRect &SrcRect, const CRect &DestRect)
   CRect gui, display;
   gui = CRect(0, 0, CDisplaySettings::GetInstance().GetCurrentResolutionInfo().iWidth, CDisplaySettings::GetInstance().GetCurrentResolutionInfo().iHeight);
 
-#ifdef TARGET_ANDROID
   display = m_display_rect;
-#else
-  display = CRect(0, 0, CDisplaySettings::GetInstance().GetCurrentResolutionInfo().iScreenWidth, CDisplaySettings::GetInstance().GetCurrentResolutionInfo().iScreenHeight);;
-#endif
   if (gui != display)
   {
     float xscale = display.Width() / gui.Width();
-- 
1.9.1

