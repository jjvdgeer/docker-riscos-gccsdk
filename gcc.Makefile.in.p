Index: gcc/Makefile.in
===================================================================
--- gcc/Makefile.in	(revision 280157)
+++ gcc/Makefile.in	(working copy)
@@ -2092,6 +2092,7 @@
 DRIVER_DEFINES = \
   -DSTANDARD_STARTFILE_PREFIX=\"$(unlibsubdir)/\" \
   -DSTANDARD_EXEC_PREFIX=\"$(libdir)/gcc/\" \
+  -DSUBTARGET_EXTRA_SPEC_FUNCTIONS= \
   -DSTANDARD_LIBEXEC_PREFIX=\"$(libexecdir)/gcc/\" \
   -DDEFAULT_TARGET_VERSION=\"$(version)\" \
   -DDEFAULT_TARGET_MACHINE=\"$(target_noncanonical)\" \
