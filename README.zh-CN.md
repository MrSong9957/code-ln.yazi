[English](README.md) | 中文

# code-ln.yazi

[Yazi](https://yazi-rs.github.io/) 预览插件，为文件预览面板添加行号显示。

## 效果预览

```
 默认模式（bat）                    快速模式（--fast）
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
│ 语法高亮（通过 bat 渲染）       │  │ 纯文本，无高亮                  │
│ 有轻微延迟（ANSI 解析开销）     │  │ 几乎零延迟                      │
└─────────────────────────────────┘  └─────────────────────────────────┘
```

| | 默认（bat） | 快速（`--fast`） |
|---|---|---|
| 语法高亮 | 有 | 无 |
| 延迟 | 轻微（ANSI 解析） | 几乎为零（纯 Lua） |
| 外部依赖 | [bat](https://github.com/sharkdp/bat)（可选） | 无 |

## 安装

```sh
ya pkg add MrSong9957/code-ln
```

## 使用

在 `yazi.toml` 中添加配置：

| 平台 | 路径 |
|------|------|
| Linux / macOS | `~/.config/yazi/yazi.toml` |
| Windows | `%AppData%\yazi\config\yazi.toml` |

**默认模式** — 通过 `bat` 提供语法高亮：

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "code-ln"
```

**快速模式** — 纯文本 + 行号，几乎零延迟：

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "code-ln --fast"
```

## 依赖

[bat](https://github.com/sharkdp/bat) 为可选依赖。未安装时插件自动降级为纯文本 + 行号。

```sh
# macOS
brew install bat

# Ubuntu/Debian
sudo apt install bat

# Windows
winget install sharkdp.bat

# 其他平台：https://github.com/sharkdp/bat#installation
```

## 作者

Mr.Song (274504958@qq.com)

## License

MIT
