# code-ln:fast

Preview text files with line numbers — no syntax highlighting, optimized for speed.

## Installation

```sh
ya pkg add MrSong9957/code-ln:fast
```

No external dependencies required.

## Usage

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "fast"
```

On Windows, the config file is at `%AppData%\yazi\config\yazi.toml`.

## License

MIT
