#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:87fc9d32cb025ba32bf70bbbc067a44ed5da571d; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:26b8f9f3f9448f88a285369ba50f5954b7d483dd \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:87fc9d32cb025ba32bf70bbbc067a44ed5da571d && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
