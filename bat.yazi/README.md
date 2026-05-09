# code-ln.yazi

Preview text files with syntax highlighting and line numbers using [bat](https://github.com/sharkdp/bat).

## Installation

```sh
ya pkg add MrSong9957/code-ln
```

Make sure [bat](https://github.com/sharkdp/bat) is installed and available in your `PATH`.

## Usage

Add this to your `~/.config/yazi/yazi.toml`:

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "code-ln"
```

On Windows, the config file is at `%AppData%\yazi\config\yazi.toml`.

## Features

- Syntax highlighting powered by `bat`
- Line numbers displayed in the preview pane
- Scrollable with mouse wheel
- Fallback to plain text when `bat` is unavailable
- Single-file cache to avoid redundant `bat` invocations

## License

MIT
