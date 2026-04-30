#!/usr/bin/env bash
set -euo pipefail

# redroid-pinterest-automation — One-time setup script
# Run AFTER the container is running and ADB is connected.

SERIAL="${ANDROID_SERIAL:-172.17.0.4:5555}"
ADB="adb -s $SERIAL"
ADB_SHELL="$ADB shell"

echo "=== Step 1: Disable conflicting service on port 5555 ==="
$ADB_SHELL "pm disable com.hagaseca.thost9" 2>/dev/null || true
$ADB_SHELL "setprop service.adb.tcp.port 5555"
$ADB_SHELL "setprop ctl.stop adbd" 2>/dev/null || true
sleep 2
$ADB_SHELL "setprop ctl.start adbd"
sleep 3

echo "=== Step 2: Push host ADB key for auto-auth ==="
if [ -f ~/.android/adbkey.pub ]; then
  $ADB_SHELL "mkdir -p /data/misc/adb"
  cat ~/.android/adbkey.pub | $ADB_SHELL "cat > /data/misc/adb/adb_keys"
  echo "ADB keys pushed."
else
  echo "No ~/.android/adbkey.pub found — you may need to accept the RSA prompt manually."
fi

echo "=== Step 3: Install ADBKeyBoard ==="
$ADB install -r apk/adbkeyboard.apk
$ADB_SHELL "ime enable com.android.adbkeyboard/.AdbIME"
echo "ADBKeyBoard installed and enabled."

echo "=== Step 4: Grant Pinterest permissions ==="
$ADB_SHELL "appops set com.pinterest READ_EXTERNAL_STORAGE allow" 2>/dev/null || true
$ADB_SHELL "appops set com.pinterest WRITE_EXTERNAL_STORAGE allow" 2>/dev/null || true
$ADB_SHELL "appops set com.pinterest MANAGE_EXTERNAL_STORAGE allow" 2>/dev/null || true

echo "=== Step 5: Disable animations ==="
$ADB_SHELL "settings put global window_animation_scale 0"
$ADB_SHELL "settings put global transition_animation_scale 0"
$ADB_SHELL "settings put global animator_duration_scale 0"

echo "=== Step 6: Push sample images ==="
$ADB_SHELL "mkdir -p /storage/emulated/0/DCIM/Camera"
for img in images/sample-pins/*.jpg; do
  [ -f "$img" ] && $ADB push "$img" /storage/emulated/0/DCIM/Camera/
done
echo "Sample images pushed."

echo ""
echo "=== SETUP COMPLETE ==="
echo "To verify: $ADB devices"
echo "Quick test:  scripts/androidctl pinter status"
