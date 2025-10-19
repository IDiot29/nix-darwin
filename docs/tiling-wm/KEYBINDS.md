# Yabai + skhd Keybindings

> **Mod Key**: `Option` (⌥) - Similar to Niri's Super key on Linux
>
> **Note**: On MacBook keyboards, the Option key is next to Command (⌘)

This configuration provides tiling window management on macOS similar to Niri on NixOS.

---

## Window Focus (Navigation)

Move focus between windows using Vim-style navigation:

| Keybind | Action |
|---------|--------|
| `Option + H` | Focus window to the left |
| `Option + J` | Focus window below |
| `Option + K` | Focus window above |
| `Option + L` | Focus window to the right |

---

## Window Movement

Move windows around the workspace:

| Keybind | Action |
|---------|--------|
| `Option + Shift + H` | Swap window with window to the left |
| `Option + Shift + J` | Swap window with window below |
| `Option + Shift + K` | Swap window with window above |
| `Option + Shift + L` | Swap window with window to the right |

### Warp (Advanced Movement)

Change window position in the BSP tree:

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + H` | Warp window to the left |
| `Option + Ctrl + J` | Warp window down |
| `Option + Ctrl + K` | Warp window up |
| `Option + Ctrl + L` | Warp window to the right |

---

## Window Resize

| Keybind | Action |
|---------|--------|
| `Option + Shift + R` | Resize window horizontally |
| `Option + Shift + E` | Resize window vertically |

---

## Window Actions

| Keybind | Action |
|---------|--------|
| `Option + Q` | Close focused window |
| `Option + F` | Toggle fullscreen (zoom) |
| `Option + Shift + F` | Toggle native fullscreen |
| `Option + Shift + Space` | Toggle window float |
| `Option + E` | Toggle split orientation (vertical/horizontal) |
| `Option + Shift + B` | Balance space (equalize window sizes) |

---

## Applications

Launch your favorite apps:

| Keybind | Action |
|---------|--------|
| `Option + Return` | Open Terminal (Ghostty) |
| `Option + B` | Open Browser (Google Chrome) |
| `Option + N` | Open Finder |
| `Option + D` | Open Spotlight (launcher) |

---

## Workspace/Space Management

Switch between and manage macOS Spaces (similar to Niri workspaces):

### Switch to Space

| Keybind | Action |
|---------|--------|
| `Option + 1-9` | Switch to space 1-9 |
| `Option + Tab` | Focus recent space |
| `Option + P` | Focus previous space |
| `Option + N` | Focus next space |

### Move Window to Space

| Keybind | Action |
|---------|--------|
| `Option + Shift + 1-9` | Move window to space 1-9 |

### Create/Destroy Spaces

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + N` | Create new space |
| `Option + Ctrl + X` | Destroy current space |

---

## Display/Monitor Management

For multi-monitor setups:

### Focus Display

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + 1-3` | Focus display 1-3 |

### Move Window to Display

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + Shift + 1-3` | Move window to display 1-3 |

---

## Layout Management

| Keybind | Action |
|---------|--------|
| `Option + Shift + T` | Toggle layout (BSP <-> Float) |
| `Option + R` | Rotate tree 90 degrees |
| `Option + X` | Mirror tree horizontally (x-axis) |
| `Option + Y` | Mirror tree vertically (y-axis) |

---

## Yabai Service Management

| Keybind | Action |
|---------|--------|
| `Option + Ctrl + Shift + R` | Restart yabai |
| `Option + Ctrl + Shift + Q` | Stop yabai |

---

## System

| Keybind | Action |
|---------|--------|
| `Option + Shift + Escape` | Lock screen |

### Screenshots (macOS Default)

| Keybind | Action |
|---------|--------|
| `Cmd + Shift + 3` | Capture full screen |
| `Cmd + Shift + 4` | Capture selection |
| `Cmd + Shift + 5` | Open screenshot menu |

---

## Mouse Actions

| Action | Keybind |
|--------|---------|
| Move window | `Cmd + Left Click + Drag` |
| Resize window | `Cmd + Right Click + Drag` |

---

## Window Rules

These apps will NOT be tiled (will float by default):

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

### 1. Enable SIP Partial Disable

Yabai requires disabling System Integrity Protection for some features.
See: https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

### 2. Grant Accessibility Permissions

- System Settings → Privacy & Security → Accessibility
- Add and enable `yabai` and `skhd`

### 3. Mission Control Settings

For best experience:
- System Settings → Desktop & Dock
- Disable "Automatically rearrange Spaces based on most recent use"
- Enable "Displays have separate Spaces" (multi-monitor)

### 4. Restart Services

Via skhd:
```
Option + Ctrl + Shift + R
```

Or manually:
```bash
brew services restart yabai
brew services restart skhd
```

### 5. Check Status

```bash
brew services list
yabai -m query --windows --window | jq
```

---

## Resources

- [Yabai Documentation](https://github.com/koekeishiya/yabai)
- [skhd Documentation](https://github.com/koekeishiya/skhd)
- [Nix Darwin](https://github.com/LnL7/nix-darwin)

---

**Config Location**: `~/.config/nix-darwin/darwin/`
- `yabai.nix` - Window manager configuration
- `skhd.nix` - Keybinding configuration
