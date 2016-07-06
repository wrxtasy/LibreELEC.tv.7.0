From 6c055cec50afda77631d4984f6eae48f9f745527 Mon Sep 17 00:00:00 2001
From: "Chris \"Koying\" Browet" <cbro@semperpax.com>
Date: Mon, 28 Mar 2016 18:04:53 +0200
Subject: [PATCH] FIX: alphanumeric sort: only do numeric sort for pure numeric

---
 xbmc/utils/StringUtils.cpp | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/xbmc/utils/StringUtils.cpp b/xbmc/utils/StringUtils.cpp
index df7a85a..1015db6 100644
--- a/xbmc/utils/StringUtils.cpp
+++ b/xbmc/utils/StringUtils.cpp
@@ -763,9 +763,11 @@ int StringUtils::FindNumber(const std::string& strInput, const std::string &strF
 // and 0 if they are identical (essentially calculates left - right)
 int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *right)
 {
+  bool isNumeric = true;
+  int64_t numericResult = 0;
   wchar_t *l = (wchar_t *)left;
   wchar_t *r = (wchar_t *)right;
-  wchar_t *ld, *rd;
+  wchar_t *ld = nullptr, *rd = nullptr;
   wchar_t lc, rc;
   int64_t lnum, rnum;
   const std::collate<wchar_t>& coll = std::use_facet<std::collate<wchar_t> >(g_langInfo.GetSystemLocale());
@@ -773,7 +775,7 @@ int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *rig
   while (*l != 0 && *r != 0)
   {
     // check if we have a numerical value
-    if (*l >= L'0' && *l <= L'9' && *r >= L'0' && *r <= L'9')
+    if (isNumeric && *l >= L'0' && *l <= L'9' && *r >= L'0' && *r <= L'9')
     {
       ld = l;
       lnum = 0;
@@ -792,19 +794,28 @@ int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *rig
       // do we have numbers?
       if (lnum != rnum)
       { // yes - and they're different!
-        return lnum - rnum;
+        numericResult = lnum - rnum;
       }
       l = ld;
       r = rd;
       continue;
     }
+    if (isNumeric && (ld || rd))
+    {
+      // Restart
+      isNumeric = false;
+      ld = rd = nullptr;
+      l = (wchar_t *)left;
+      r = (wchar_t *)right;
+      continue;
+    }
     // do case less comparison
     lc = *l;
     if (lc >= L'A' && lc <= L'Z')
-      lc += L'a'-L'A';
+      lc += L'a' - L'A';
     rc = *r;
     if (rc >= L'A' && rc <= L'Z')
-      rc += L'a'- L'A';
+      rc += L'a' - L'A';
 
     // ok, do a normal comparison, taking current locale into account. Add special case stuff (eg '(' characters)) in here later
     if ((cmp_res = coll.compare(&lc, &lc + 1, &rc, &rc + 1)) != 0)
@@ -813,6 +824,9 @@ int64_t StringUtils::AlphaNumericCompare(const wchar_t *left, const wchar_t *rig
     }
     l++; r++;
   }
+  if (isNumeric)
+    return numericResult;
+
   if (*r)
   { // r is longer
     return -1;
