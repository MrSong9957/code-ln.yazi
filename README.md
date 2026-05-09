English | [中文](README.zh-CN.md)

# code-ln.yazi

Two previewer plugins for [Yazi](https://yazi-rs.github.io/) that add line numbers to the file preview pane.

## Preview

```
 bat version                          fast version
┌─────────────────────────────────┐  ┌─────────────────────────────────┐
│   1 │ local M = {}               │  │   1 local M = {}                │
│   2 │ local cache = {}           │  │   2 local cache = {}            │
│   3 │                            │  │   3                             │
│   4 │ function M:peek(job)       │  │   4 function M:peek(job)        │
│   5 │     local skip = job.skip  │  │   5     local skip = job.skip   │
│   6 │     local area = job.area  │  │   6     local area = job.area   │
│   7 │     if not area then       │  │   7     if not area then        │
│   8 │         return             │  │   8         return              │
│   9 │     end                    │  │   9     end                     │
│  10 │                            │  │  10                             │
│  11 │     if cache.url ~= url    │  │  11     if cache.url ~= url     │
│  12 │         cache = {}         │  │  12         cache = {}          │
│  13 │     end                    │  │  13     end                     │
│  14 │ end                        │  │  14 end                         │
│                                 │  │                                 │
│ Syntax highlighted via bat      │  │ Plain text, no highlighting     │
│ Slight latency from ANSI parse  │  │ Near-zero latency               │
└─────────────────────────────────┘  └─────────────────────────────────┘
```

| | bat | fast |
|---|---|---|
| Syntax highlighting | Yes | No |
| Latency | Slight (ANSI parsing) | Near-zero (pure Lua) |
| External dependency | [bat](https://github.com/sharkdp/bat) | None |
| Install command | `ya pkg add MrSong9957/code-ln:bat` | `ya pkg add MrSong9957/code-ln:fast` |

## AI-Assisted Installation

Tell your AI assistant (Claude Code, Codex, Cursor, Cline, etc.):

> Install the **bat** version of code-ln.yazi from https://github.com/MrSong9957/code-ln.yazi

Or for the fast version:

> Install the **fast** version of code-ln.yazi from https://github.com/MrSong9957/code-ln.yazi

The AI should perform these steps:

**1. Install the plugin package:**

```sh
# bat version (with syntax highlighting)
ya pkg add MrSong9957/code-ln:bat

# fast version (no highlighting, zero latency)
ya pkg add MrSong9957/code-ln:fast
```

**2. Locate the Yazi config file:**

| Platform | Path |
|----------|------|
| Linux / macOS | `~/.config/yazi/yazi.toml` |
| Windows | `%AppData%\yazi\config\yazi.toml` |

Create the file if it does not exist.

**3. Add the previewer configuration:**

For the **bat** version:

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "bat"
```

For the **fast** version:

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "fast"
```

**4. Dependencies (bat version only):**

Ensure [bat](https://github.com/sharkdp/bat) is installed and available in `PATH`. Installation: https://github.com/sharkdp/bat#installation

## Manual Installation

### 1. Install the plugin

```sh
# bat version
ya pkg add MrSong9957/code-ln:bat

# fast version
ya pkg add MrSong9957/code-ln:fast
```

### 2. Edit yazi.toml

Add the following to your yazi config (see paths above):

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "bat"   # or "fast"
```

### 3. Install bat (bat version only)

```sh
# macOS
brew install bat

# Ubuntu/Debian
sudo apt install bat

# Windows
winget install sharkdp.bat

# Other: https://github.com/sharkdp/bat#installation
```

### 4. Restart Yazi

Press `q` to quit Yazi, then reopen it. Navigate to a text file to see line numbers in the preview pane.

## Author

Mr.Song (274504958@qq.com)

## License

MIT
