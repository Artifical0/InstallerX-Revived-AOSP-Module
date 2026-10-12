SKIPUNZIP=0

ui_print "- Installing InstallerX Revived as system PackageInstaller..."
set_perm_recursive "$MODPATH/system" 0 0 0755 0644
