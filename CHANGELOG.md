# Changelog

All notable changes to the Zed SudoLang extension are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and
this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-05-12

Initial release of the Zed extension for SudoLang.

### Added

- Language registration for `.sudo`, `.sudo.md`, and `.mdc` files.
- Pin to the [`tree-sitter-sudolang`](https://github.com/dylan-gluck/tree-sitter-sudolang)
  grammar via `[grammars.sudolang]` in `extension.toml`.
- Highlighting, outline, bracket-matching, indent, fold, and code-injection
  queries under `languages/sudolang/`.
- Language config (`languages/sudolang/config.toml`): line / block comment
  tokens, autoclose pairs, surround pairs, word characters.

[0.1.0]: https://github.com/dylan-gluck/zed-sudolang/releases/tag/v0.1.0
