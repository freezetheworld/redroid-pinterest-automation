# Screen Coordinates Reference (720×1280)

These coordinates are for `redroid/redroid:12.0.0_64only-latest` at 720×1280 resolution.
If you change the resolution, all coordinates need recalibration.

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

## Pin Detail → Save

1. Tap top-right corner: **(660, 70)** → opens action menu
2. Tap "Save" option: **(149, 864)**
3. Tap first board in picker: **(360, 480)**

## Create Tab

Options at y=1077–1108:
- **Pin**: (185, 1093)
- **Collage**: (360, 1093)
- **Board**: (536, 1093)

## Board Creation

- "+ Create board" button: **(222, 1104)**
- Board name input field: tap **(200, 340)**
- Done / confirm: tap **(640, 130)**

## Gallery Picker (Create Pin flow)

- First image thumbnail: **(120, 480)**
- "Next" button: **(660, 100)**
- Title field: **(200, 600)**
- "Pick a board" option: **(180, 620)**
- "Create" / Post button: **(360, 1130)**

## Known Coordinate Issues

- **Save-to-board picker**: Board list items are unreliable to tap via coordinates — the image preview intercepts taps. Use the Create tab → gallery picker flow as a workaround.
- **Post button**: In the create pin editor, the Post button position varies by Pinterest version. On 14.9.0 it's at the bottom after scrolling past "Advanced Settings".
