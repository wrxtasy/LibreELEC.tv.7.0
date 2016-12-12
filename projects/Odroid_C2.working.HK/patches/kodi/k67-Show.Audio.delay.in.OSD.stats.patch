From ef6cbdb95ffd755749c4dc15b6f12cfe6d9daa64 Mon Sep 17 00:00:00 2001
From: "Chris \"Koying\" Browet" <cbro@semperpax.com>
Date: Tue, 26 Jan 2016 19:27:15 +0100
Subject: [PATCH] CHG: Show audio delay in OSD stats

---
 xbmc/cores/dvdplayer/DVDPlayer.cpp      | 7 +++++--
 xbmc/cores/dvdplayer/DVDPlayerAudio.cpp | 2 ++
 xbmc/cores/dvdplayer/DVDPlayerAudio.h   | 6 ++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xbmc/cores/dvdplayer/DVDPlayer.cpp b/xbmc/cores/dvdplayer/DVDPlayer.cpp
index 4ffe33a..278b111 100644
--- a/xbmc/cores/dvdplayer/DVDPlayer.cpp
+++ b/xbmc/cores/dvdplayer/DVDPlayer.cpp
@@ -3078,7 +3078,9 @@ void CDVDPlayer::GetGeneralInfo(std::string& strGeneralInfo)
     }
     else
     {
-      double dDelay = m_dvdPlayerVideo->GetDelay() / DVD_TIME_BASE - g_renderManager.GetDisplayLatency();
+      double dDelay = m_dvdPlayerAudio->GetDelay() / DVD_TIME_BASE;
+      double dCache = m_dvdPlayerAudio->GetCacheTotal();
+//      double dDelay = m_dvdPlayerVideo->GetDelay() / DVD_TIME_BASE - g_renderManager.GetDisplayLatency();
 
       double apts = m_dvdPlayerAudio->GetCurrentPts();
       double vpts = m_dvdPlayerVideo->GetCurrentPts();
@@ -3100,8 +3102,9 @@ void CDVDPlayer::GetGeneralInfo(std::string& strGeneralInfo)
           strBuf += StringUtils::Format(" %d sec", DVD_TIME_TO_SEC(m_StateInput.cache_delay));
       }
 
-      strGeneralInfo = StringUtils::Format("C( ad:% 6.3f, a/v:% 6.3f%s, dcpu:%2i%% acpu:%2i%% vcpu:%2i%%%s )"
+      strGeneralInfo = StringUtils::Format("C( ad:% 6.3f(%6.3f), a/v:% 6.3f%s, dcpu:%2i%% acpu:%2i%% vcpu:%2i%%%s )"
                                            , dDelay
+                                           , dCache
                                            , dDiff
                                            , strEDL.c_str()
                                            , (int)(CThread::GetRelativeUsage()*100)
diff --git a/xbmc/cores/dvdplayer/DVDPlayerAudio.cpp b/xbmc/cores/dvdplayer/DVDPlayerAudio.cpp
index 609b9a4..0d86098 100644
--- a/xbmc/cores/dvdplayer/DVDPlayerAudio.cpp
+++ b/xbmc/cores/dvdplayer/DVDPlayerAudio.cpp
@@ -488,6 +488,8 @@ void CDVDPlayerAudio::UpdatePlayerInfo()
 
   SInfo info;
   info.info        = s.str();
+  info.delay       = m_dvdAudio.GetDelay();
+  info.cache       = m_dvdAudio.GetCacheTime();
   info.pts         = m_dvdAudio.GetPlayingPts();
   info.passthrough = m_pAudioCodec && m_pAudioCodec->NeedPassthrough();
 
diff --git a/xbmc/cores/dvdplayer/DVDPlayerAudio.h b/xbmc/cores/dvdplayer/DVDPlayerAudio.h
index 014574d..9387e8a 100644
--- a/xbmc/cores/dvdplayer/DVDPlayerAudio.h
+++ b/xbmc/cores/dvdplayer/DVDPlayerAudio.h
@@ -138,8 +138,8 @@ class CDVDPlayerAudio : public CThread, public IDVDStreamPlayerAudio
   bool IsStalled() const                            { return m_stalled;  }
   bool IsEOS()                                      { return false; }
   bool IsPassthrough() const;
-  double GetDelay() { return 0.0; }
-  double GetCacheTotal() { return 0.0; }
+  double GetDelay()                                 { CSingleLock lock(m_info_section); return m_info.delay; }
+  double GetCacheTotal()                            { CSingleLock lock(m_info_section); return m_info.cache; }
 protected:
 
   virtual void OnStartup();
@@ -237,6 +237,8 @@ class CDVDPlayerAudio : public CThread, public IDVDStreamPlayerAudio
     {}
 
     std::string      info;
+    double           delay;
+    double           cache;
     double           pts;
     bool             passthrough;
   };
