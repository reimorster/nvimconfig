---

# 🧩 Neovim Keybinding Cheatsheet

> Leader: **`Space`**

---

## 🌍 Core Movement & Editing

| Keys                | Action                           |
| ------------------- | -------------------------------- |
| `j` / `k`           | Smart move (wrap-aware)          |
| `<` / `>` in Visual | Indent and stay selected         |
| `J` / `K` in Visual | Move selected lines down/up      |
| `<Esc>`             | Clear search highlight           |
| `n` / `N`           | Next/prev search + center        |
| `J` (Normal)        | Join line without jumping cursor |

---

## 📁 Buffers, Splits, Windows

| Keys         | Action           |
| ------------ | ---------------- |
| `<leader>sv` | Split vertical   |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Equalize splits  |
| `<leader>sx` | Close split      |
| `<S-l>`      | Next buffer      |
| `<S-h>`      | Previous buffer  |
| `<leader>bd` | Delete buffer    |

---

## 💾 File & Session

| Keys        | Action      |
| ----------- | ----------- |
| `<leader>w` | Save        |
| `<leader>q` | Quit        |
| `<leader>x` | Save & quit |

---

## 📋 Clipboard & Register Hygiene

| Keys         | Action                        |
| ------------ | ----------------------------- |
| `<leader>y`  | Yank to system clipboard      |
| `<leader>Y`  | Yank line to clipboard        |
| `<leader>d`  | Delete to black hole (`"_`)   |
| `p` (Visual) | Paste without losing register |

---

## 🧰 Selection / Misc

| Keys         | Action                            |
| ------------ | --------------------------------- |
| `<leader>a`  | Select all                        |
| `[d` / `]d`  | Previous / next diagnostic        |
| `<leader>e`  | Show diagnostics popup            |
| `<leader>qf` | Populate loclist with diagnostics |

---

## 🧠 LSP Essentials

| Keys         | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gD`         | Go to declaration    |
| `gi`         | Go to implementation |
| `gr`         | Find references      |
| `K`          | Hover symbol         |
| `<leader>rn` | Rename symbol        |
| `<leader>ca` | Code action          |
| `<leader>f`  | Format buffer        |

---

## 🔍 Telescope (if installed)

| Keys         | Action        |
| ------------ | ------------- |
| `<leader>ff` | Find files    |
| `<leader>fg` | Live grep     |
| `<leader>fb` | Buffer picker |
| `<leader>fh` | Help tags     |

---

## 🖥 Terminal Mode

| Keys                  | Action            |
| --------------------- | ----------------- |
| `<Esc>` (in Terminal) | Enter Normal mode |

---

## 📝 UX Principles Followed

* Uses `<Space>` as leader
* Smart movement on wrapped lines
* Doesn’t override core motions like `s`, `c`, `d`
* Treats buffers like tabs
* Clipboard and deletion sane defaults
* Plugin-agnostic mappings central, plugin mappings lazy-aware

---

