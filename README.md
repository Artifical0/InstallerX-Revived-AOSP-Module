# InstallerX Revived AOSP Module

Auto-synced Magisk / KernelSU / APatch module that installs [InstallerX Revived](https://github.com/wxxsfxyzm/InstallerX-Revived) as the system package installer (`com.android.packageinstaller`).

将 InstallerX Revived 替换为系统安装器的模块，自动跟随上游最新发布版本构建。

## How it works

- Every 2 hours a GitHub Actions job checks the newest upstream release (stable or preview, whichever is newer).
- If it has not been built yet, the job builds it from source with `-PAPP_ID=com.android.packageinstaller`, signs it with this repo's own fixed key, and packs it in the same layout as the official AOSP module (`system/priv-app/PackageInstaller/PackageInstaller.apk`).
- `update.json` is updated, so your root manager shows the update and installs it in one tap.

## Install

1. Download the zip from [Releases](../../releases/latest) and flash it in Magisk / KernelSU / APatch.
2. Reboot.

New releases are announced on the Telegram channel [@ByteJuno](https://t.me/ByteJuno). 新版本发布会推送到 Telegram 频道 [@ByteJuno](https://t.me/ByteJuno)，欢迎关注。

The module id is `com.android.packageinstaller`, the same as the official AOSP module, so it updates that module in place.

## Notes

- The APK is signed with this repo's key, not upstream's. Switching from the official module changes the system installer's signature once; after that it stays stable.
- APK `versionCode` is `1000000000 + upstream's` (git commit count). It must outrank the vendor installer at the same package name (ColorOS 17 ships 17000001), otherwise PackageManager ignores this copy. Updates never downgrade.
- Do not install a `com.android.packageinstaller` APK on top manually: a `/data` update with a higher versionCode hides the module's copy.
- Builds are unmodified upstream source apart from the application id. Report app bugs upstream only if they reproduce with official builds.

## License

Module scripts: GPL-3.0, same as upstream.
