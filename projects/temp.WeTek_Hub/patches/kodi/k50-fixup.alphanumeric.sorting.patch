From 22aa3d9e0f2132e6b0c2cc2f69d2bb323842a8b3 Mon Sep 17 00:00:00 2001
From: "Chris \"koying\" Browet" <cbro@semperpax.com>
Date: Wed, 20 Apr 2016 19:04:30 +0200
Subject: [PATCH] fixup alphanumeric sorting

---
 xbmc/utils/StringUtils.cpp | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/xbmc/utils/StringUtils.cpp b/xbmc/utils/StringUtils.cpp
index 1015db6..f774268 100644
--- a/xbmc/utils/StringUtils.cpp
+++ b/xbmc/utils/StringUtils.cpp
@@ -764,7 +764,6 @@ int StringUtils::FindNumber(const std::string& strInput, const std::string &strF
 int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *right)
 {
   bool isNumeric = true;
-  int64_t numericResult = 0;
   wchar_t *l = (wchar_t *)left;
   wchar_t *r = (wchar_t *)right;
   wchar_t *ld = nullptr, *rd = nullptr;
@@ -772,6 +771,7 @@ int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *rig
   int64_t lnum, rnum;
   const std::collate<wchar_t>& coll = std::use_facet<std::collate<wchar_t> >(g_langInfo.GetSystemLocale());
   int cmp_res = 0;
+
   while (*l != 0 && *r != 0)
   {
     // check if we have a numerical value
@@ -792,23 +792,24 @@ int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *rig
         rnum += *rd++ - L'0';
       }
       // do we have numbers?
-      if (lnum != rnum)
-      { // yes - and they're different!
-        numericResult = lnum - rnum;
+      if ((*ld == 0 || *ld == L' ') && (*rd == 0 || *rd == L' '))
+      {
+        if (lnum != rnum)
+          return lnum - rnum;
+      }
+      else
+      {
+        // Restart
+        isNumeric = false;
+        ld = rd = nullptr;
+        l = (wchar_t *)left;
+        r = (wchar_t *)right;
+        continue;
       }
       l = ld;
       r = rd;
       continue;
     }
-    if (isNumeric && (ld || rd))
-    {
-      // Restart
-      isNumeric = false;
-      ld = rd = nullptr;
-      l = (wchar_t *)left;
-      r = (wchar_t *)right;
-      continue;
-    }
     // do case less comparison
     lc = *l;
     if (lc >= L'A' && lc <= L'Z')
@@ -824,9 +825,6 @@ int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *rig
     }
     l++; r++;
   }
-  if (isNumeric)
-    return numericResult;
-
   if (*r)
   { // r is longer
     return -1;
