# Zen Mods

A collection of custom mods for [Zen Browser](https://zen-browser.app/).

## Mods

### [Active Tab Halo](./active-tab-halo)
Highlights only the active tab with a Firefox-style `2.5px` orange-to-purple border and subtle surface tint across both compact and full-size sidebars.

| Full-Size Sidebar | Compact Sidebar |
| :---: | :---: |
| ![Full-Size Sidebar](./active-tab-halo/images/full-sidebar.png) | ![Compact Sidebar](./active-tab-halo/images/compact-sidebar.png) |

---

## Install from GitHub

You can install or test the mods directly into your local Zen Browser profile using the helper scripts in [`dev/`](./dev):

1. **Clone the repository:**
   ```zsh
   git clone https://github.com/Rory-Miley/zen_mods.git
   cd zen_mods
   ```

2. **Sync the mod(s) into your Zen profile:**
   ```zsh
   # Install/sync all mods in this repo:
   ./dev/sync-mods.sh

   # Or install a single mod by folder name:
   ./dev/sync-mods.sh active-tab-halo
   ```
   *(By default, the script automatically detects your `*.Default (release)` Zen profile in `~/Library/Application Support/zen/Profiles`. You can override it with `ZEN_PROFILE="/path/to/profile" ./dev/sync-mods.sh`.)*

3. **Activate / Hot-Reload in Zen Browser:**
   - Open `about:preferences#zenMarketplace` (**Settings → Look and Feel → Zen Mods**).
   - Toggle **Active Tab Halo** off and back on (or restart Zen Browser) to apply the styles immediately.

### Live Development (Auto-Sync on Save)
If you are tweaking `chrome.css` or `theme.json`, run the file watcher to automatically sync changes to your Zen profile every time you save:
```zsh
./dev/watch-mods.sh
```
