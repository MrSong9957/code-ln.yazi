English | [中文](README.zh-CN.md)

# code-ln.yazi

A [Yazi](https://yazi-rs.github.io/) previewer plugin that adds line numbers to the file preview pane.

## Preview

```
 Default mode (bat)                  Fast mode (--fast)
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

| | Default (bat) | Fast (`--fast`) |
|---|---|---|
| Syntax highlighting | Yes | No |
| Latency | Slight (ANSI parsing) | Near-zero (pure Lua) |
| External dependency | [bat](https://github.com/sharkdp/bat) (optional) | None |

## Installation

```sh
ya pkg add MrSong9957/code-ln
```

## Usage

Add to your `yazi.toml`:

| Platform | Path |
|----------|------|
| Linux / macOS | `~/.config/yazi/yazi.toml` |
| Windows | `%AppData%\yazi\config\yazi.toml` |

**Default mode** — syntax highlighting via `bat`:

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "code-ln"
```

**Fast mode** — plain text with line numbers, near-zero latency:

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "code-ln --fast"
```

## Dependencies

[bat](https://github.com/sharkdp/bat) is optional. If not installed, the plugin automatically falls back to plain text with line numbers.

```sh
# macOS
brew install bat

# Ubuntu/Debian
sudo apt install bat

# Windows
winget install sharkdp.bat

# Other: https://github.com/sharkdp/bat#installation
```

## Author

Mr.Song (274504958@qq.com)

## License

MIT
