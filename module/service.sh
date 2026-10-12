#!/system/bin/sh
# Drop stale parsed-package cache once so the overlaid PackageInstaller is re-parsed.
rm -rf /data/system/package_cache/*
rm "$0"
