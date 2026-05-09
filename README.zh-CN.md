[English](README.md) | 中文

# code-ln.yazi

两个 [Yazi](https://yazi-rs.github.io/) 预览插件，为文件预览面板添加行号显示。

## 效果预览

```
 bat 版本                              fast 版本
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

| | bat | fast |
|---|---|---|
| 语法高亮 | 有 | 无 |
| 延迟 | 轻微（ANSI 解析） | 几乎为零（纯 Lua） |
| 外部依赖 | [bat](https://github.com/sharkdp/bat) | 无 |
| 安装命令 | `ya pkg add MrSong9957/code-ln:bat` | `ya pkg add MrSong9957/code-ln:fast` |

## AI 辅助安装

向你的 AI 助手（Claude Code、Codex、Cursor、Cline 等）发送：

> 从 https://github.com/MrSong9957/code-ln.yazi 安装 **bat** 版本

或 fast 版本：

> 从 https://github.com/MrSong9957/code-ln.yazi 安装 **fast** 版本

AI 会自动执行以下步骤：

**1. 安装插件包：**

```sh
# bat 版本（带语法高亮）
ya pkg add MrSong9957/code-ln:bat

# fast 版本（无高亮，零延迟）
ya pkg add MrSong9957/code-ln:fast
```

**2. 定位 Yazi 配置文件：**

| 平台 | 路径 |
|------|------|
| Linux / macOS | `~/.config/yazi/yazi.toml` |
| Windows | `%AppData%\yazi\config\yazi.toml` |

如果文件不存在则创建。

**3. 添加预览器配置：**

**bat** 版本：

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "bat"
```

**fast** 版本：

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "fast"
```

**4. 依赖（仅 bat 版本）：**

确保 [bat](https://github.com/sharkdp/bat) 已安装并在 `PATH` 中。安装方式：https://github.com/sharkdp/bat#installation

## 手动安装

### 1. 安装插件

```sh
# bat 版本
ya pkg add MrSong9957/code-ln:bat

# fast 版本
ya pkg add MrSong9957/code-ln:fast
```

### 2. 编辑 yazi.toml

在 Yazi 配置文件中（路径见上方）添加：

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "bat"   # 或 "fast"
```

### 3. 安装 bat（仅 bat 版本）

```sh
# macOS
brew install bat

# Ubuntu/Debian
sudo apt install bat

# Windows
winget install sharkdp.bat

# 其他平台：https://github.com/sharkdp/bat#installation
```

### 4. 重启 Yazi

按 `q` 退出 Yazi，重新打开。导航到任意文本文件，即可在预览面板中看到行号。

## License

MIT
