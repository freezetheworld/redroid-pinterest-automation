# Redroid Pinterest Automation

Android container (redroid) running Pinterest 14.9.0 for automated pin creation, saving, and board management. Uses ADB for device control with a custom Python automation script.

## Quick Start

```bash
# 1. Start the container
docker compose up -d

# 2. Wait for Android to boot (~30s), then run setup
ANDROID_SERIAL=172.17.0.4:5555 bash scripts/setup.sh

# 3. Launch Pinterest and automate
ANDROID_SERIAL=172.17.0.4:5555 scripts/androidctl pinter open
ANDROID_SERIAL=172.17.0.4:5555 scripts/androidctl pinter search-and-save "coffee art"
```

## How It Works

- **Redroid container**: `redroid/redroid:12.0.0_64only` running Android 12
- **Pinterest 14.9.0**: Installed via Uptodown App Store (APK included in `/data` volume)
- **ADBKeyBoard**: Custom input method for reliable text entry (base64 broadcast)
- **`androidctl`**: 578-line Python script with tab navigation, search, save, and pin creation

## Project Structure

```
├── docker-compose.yml       # Container definition (port 5555, volume mount)
├── scripts/
│   ├── androidctl           # Main automation script (578 LOC)
│   └── setup.sh             # One-time container setup (permissions, APK, keys)
├── apk/
│   └── adbkeyboard.apk      # ADB keyboard for reliable text input
├── images/
│   ├── sample-pins/         # JPEG images for pin creation
│   └── screenshots/         # Proof screenshots from automation runs
├── docs/
│   └── coordinates.md       # Screen coordinate reference
└── README.md
```

## Commands Reference

### Navigation
| Command | Action |
|---------|--------|
| `androidctl pinter open` | Launch Pinterest → Home tab |
| `androidctl pinter close` | Force-stop Pinterest |
| `androidctl pinter tab <name>` | Navigate to: home/search/create/inbox/saved |
| `androidctl pinter status` | Check foreground activity |

### Pins
| Command | Action |
|---------|--------|
| `androidctl pinter search <query>` | Search Pinterest |
| `androidctl pinter search-and-save <query>` | Full: search → open → save |
| `androidctl pinter save` | Save current pin via action menu |
| `androidctl pinter create-from-image` | Share image via intent → create board → save |

### General
| Command | Action |
|---------|--------|
| `androidctl tap <x> <y>` | Tap coordinates |
| `androidctl text "<string>"` | Type text via ADB keyboard |
| `androidctl screenshot <path>` | Capture screen |

## ADB Troubleshooting

If ADB shows "offline":

```bash
# Kill conflicting service and restart adbd
docker exec redroid-pinterest sh -lc '
  pm disable com.hagaseca.thost9
  setprop service.adb.tcp.port 5555
  setprop ctl.stop adbd; sleep 2
  setprop ctl.start adbd
'
adb kill-server; adb start-server
adb connect 172.17.0.4:5555
```

## Requirements

- Docker with `--privileged` support (required for redroid)
- Linux host with kernel support for binder/ashmem
- ADB installed on host (`apt install adb`)
