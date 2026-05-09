# code-ln.yazi

Two previewer plugins for text files with line numbers.

## bat (syntax highlighted)

Uses [bat](https://github.com/sharkdp/bat) for syntax highlighting with line numbers.

```sh
ya pkg add MrSong9957/code-ln:bat
```

Requires [bat](https://github.com/sharkdp/bat) installed.

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "bat"
```

## fast (no highlighting)

Pure Lua implementation — no external dependencies, near-zero latency.

```sh
ya pkg add MrSong9957/code-ln:fast
```

```toml
[[plugin.prepend_previewers]]
mime = "text/*"
run = "fast"
```

## License

MIT
