# AeroSpace Keybindings

> **Mod Key**: `Option` (⌥) – same mod that was used with Yabai/SKHD

This layout recreates the old workflow using the native `services.aerospace`
module shipped with nix-darwin.

---

## Window Focus (Navigation)

| Keybind | Action |
|---------|--------|
| `Option + H` | Focus window to the left |
| `Option + J` | Focus window below |
| `Option + K` | Focus window above |
| `Option + L` | Focus window to the right |

---

## Window Movement

| Keybind | Action |
|---------|--------|
| `Option + Shift + H` | Swap window with window to the left |
| `Option + Shift + J` | Swap window with window below |
| `Option + Shift + K` | Swap window with window above |
| `Option + Shift + L` | Swap window with window to the right |

### Move (Warp)

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + H` | Move focused window left |
| `Option + Ctrl + J` | Move focused window down |
| `Option + Ctrl + K` | Move focused window up |
| `Option + Ctrl + L` | Move focused window right |

---

## Window Resize

| Keybind | Action |
|---------|--------|
| `Option + Shift + R` | Grow window width (+120 px) |
| `Option + Shift + E` | Grow window height (+120 px) |

---

## Window Actions

| Keybind | Action |
|---------|--------|
| `Option + Q` | Close focused window |
| `Option + F` | Toggle AeroSpace fullscreen |
| `Option + Shift + F` | Toggle macOS native fullscreen |
| `Option + Shift + Space` | Toggle floating/tiling for focused window |
| `Option + E` | Toggle split orientation (horizontal ↔ vertical) |
| `Option + Shift + B` | Balance window sizes in workspace |

---

## Applications

| Keybind | Action |
|---------|--------|
| `Option + Return` | Launch Ghostty |
| `Option + B` | Launch Google Chrome |
| `Option + D` | Launch Spotlight |

---

## Workspace Management

| Keybind | Action |
|---------|--------|
| `Option + 1-9` | Switch to workspace 1-9 |
| `Option + Shift + 1-9` | Move focused window to workspace 1-9 |
| `Option + Tab` | Toggle between current and previous workspace |
| `Option + P` | Focus previous workspace (wraps) |
| `Option + N` | Focus next workspace (wraps) |
| `Option + Ctrl + N` | Jump to next workspace (creates if missing) |
| `Option + Ctrl + X` | Jump to previous workspace |

> AeroSpace workspaces are name-addressable and created on demand, so the
> “create” / “destroy” semantics from Yabai map to the navigation keys above.

---

## Display/Monitor Management

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + 1-3` | Focus monitor 1-3 |
| `Option + Ctrl + Shift + 1-3` | Move focused window to monitor 1-3 |

Monitor indexes follow the order reported by `aerospace list-monitors`.

---

## Layout Management

| Keybind | Action |
|---------|--------|
| `Option + Shift + T` | Toggle tiling/floating layout for workspace |
| `Option + R` | Toggle workspace orientation (horizontal ↔ vertical) |

> AeroSpace does not expose direct “mirror X/Y” commands yet, so those bindings
> are intentionally omitted.

---

## AeroSpace Service Management

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + Shift + R` | Restart AeroSpace (`launchctl kickstart`) |
| `Option + Ctrl + Shift + Q` | Stop AeroSpace (`launchctl bootout`) |

---

## System

| Keybind | Action |
|---------|--------|
| `Option + Shift + Escape` | Lock screen (`pmset displaysleepnow`) |

### Screenshots (macOS Default)

| Keybind | Action |
|---------|--------|
| `Cmd + Shift + 3` | Capture full screen |
| `Cmd + Shift + 4` | Capture selection |
| `Cmd + Shift + 5` | Screenshot toolbar |

---

## Mouse Actions

Native macOS mouse shortcuts remain the same:

| Action | Keybind |
|--------|---------|
| Move window | `Cmd + Left Click + Drag` |
| Resize window | `Cmd + Right Click + Drag` |

---

## Window Rules

These apps float by default via `on-window-detected` rules:

- System Settings / System Preferences
- System Information
- Activity Monitor
- Calculator
- Finder
- Archive Utility
- App Store
- KeePassXC

---

## Setup Tips

### Accessibility Permissions

- System Settings → Privacy & Security → Accessibility
- Add and enable `AeroSpace`

### Mission Control Settings

- System Settings → Desktop & Dock
- Disable “Automatically rearrange Spaces based on most recent use”
- Enable “Displays have separate Spaces” for multi-monitor setups

### Restart / Status Commands

```bash
launchctl kickstart -k "gui/$(id -u)/org.nixos.aerospace"
launchctl bootout "gui/$(id -u)/org.nixos.aerospace"
launchctl list | grep aerospace
```

---

## Resources

- [AeroSpace Documentation](https://nikitabobko.github.io/AeroSpace/)
- `darwin/aerospace.nix` – nix-darwin configuration for AeroSpace + bindings
