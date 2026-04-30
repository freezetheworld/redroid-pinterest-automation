# Screen Coordinates Reference (720×1280) — Pinterest 14.9.0

## Bottom Navigation Bar (y=1149–1181)

| Tab     | Coordinates |
|---------|-------------|
| Home    | (98, 1162)  |
| Search  | (229, 1165) |
| Create  | (360, 1165) |
| Inbox   | (491, 1162) |
| Saved   | (621, 1162) |

## Search Results Grid (2 columns)

| Column | X   | Row 1 Y | Row 2 Y | Row 3 Y | Row 4 Y |
|--------|-----|---------|---------|---------|---------|
| Left   | 192 | 450     | 650     | 850     | 1050    |
| Right  | 540 | 450     | 650     | 850     | 1050    |

## Saved Tab Sub-tabs (y~110)

| Sub-tab  | X   |
|----------|-----|
| Pins     | 180 |
| Boards   | 359 |
| Collages | 540 |

## Pin Detail → Save (Updated for 14.9.0)

1. Tap **Save pill button**: **(600, 950)** on the pin detail overlay
2. Board picker appears — tap **first board in list**: **(360, 930)**

## Create Tab

- **Pin**: (185, 1093)
- **Collage**: (360, 1093)
- **Board**: (536, 1093)

## Board Creation

- "+ Create board": **(222, 1104)**
- Board name input: tap **(200, 340)**
- Done / confirm: **(640, 130)**

## Known Issues

- ADB "device offline": disable `com.hagaseca.thost9`, set `service.adb.tcp.port=5555`
- SEND intent create-from-image flow often fails ("Pin failed to upload") — use search-and-save instead
- Gallery picker thumbnails may not display (media scanner issue on redroid)
