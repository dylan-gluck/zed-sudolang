# Changelog

All notable changes to the Zed SudoLang extension are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and
this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.3] - 2026-08-05

Lockstep release with tree-sitter-sudolang 0.3.3. The grammar `rev` is re-pinned. The extension has no functional changes.

The language server it resolves from `$PATH` now also runs as a one-shot checker (`sudolang-lsp check <file>`), which the editor path does not use.

## [0.3.2] - 2026-07-27

Lockstep release with tree-sitter-sudolang 0.3.2. The grammar `rev` is re-pinned. The extension has no functional changes.

### Changed

- README rewritten in ASD-STE100 Simplified Technical English.

## [0.3.1] - 2026-07-24

Lockstep release with tree-sitter-sudolang 0.3.1 (a packaging fix for
the grammar's Node binding). Grammar `rev` re-pinned; no functional
changes to the extension.

## [0.3.0] - 2026-07-23

SudoLang **v2.2**. Version aligned with tree-sitter-sudolang and
sudolang-lsp for the coordinated release.

### Added

- Grammar pinned to tree-sitter-sudolang 0.3.0 (v2.2 dialect):
  qualified capability names, named arguments, guard statements,
  decorators, optional chaining, nullish default, spread/rest,
  pipe placeholder.
- Highlighting for capability namespaces (`@variable.special`, matching
  sigils), decorators (`@attribute`), and the new operators
  (`->`, `??`, `?.`, `...`, `::`).
- `sudolang-lsp` now attaches to **Markdown** buffers as well — the
  preferred authoring format is `.md` (or `.sudo.md`) with `sudo` code
  fences, which the server diagnoses, formats, and navigates in place.

### Changed

- LSP not-found message points at `cargo install sudolang-lsp` and the
  prebuilt release binaries.
- `Cargo.lock` is committed (Zed extension registry requirement).

## [0.1.3] - 2026-05-12

### Added

- README documentation for the hover / completion / goto-definition
  features now provided by `sudolang-lsp` v0.2.0. The extension's wiring
  is unchanged — LSP capabilities are advertised by the server itself
  via its `initialize` response.

## [0.1.2] - 2026-05-12

### Added

- Rust extension scaffolding: `Cargo.toml` (cdylib targeting
  `wasm32-wasip1`) and `src/lib.rs` implementing `zed::Extension`.
- `[language_servers.sudolang-lsp]` registration in `extension.toml`.
  The extension resolves the `sudolang-lsp` binary from `$PATH` via
  `worktree.which(...)` and surfaces a setup hint if it's missing.
- `language_server_initialization_options` and
  `language_server_workspace_configuration` pass through user settings
  to the server.
- README section documenting the language-server install and the
  `format_on_save` setting.

## [0.1.1] - 2026-05-12

### Changed

- Registered file types narrowed to `.sudo` only. Markdown files (`.md`,
  `.sudo.md`, `.mdc`) are now handled by Zed's built-in Markdown extension;
  this extension is injected into `sudo` / `SudoLang` code fences via
  Markdown's standard injection mechanism.
- Re-pinned `[grammars.sudolang]` to the v0.1.1 release of
  [`tree-sitter-sudolang`](https://github.com/dylan-gluck/tree-sitter-sudolang),
  which targets the SudoLang v2.1 dialect (strict block structure, prose
  expressed as string literals or comments, single-word identifiers).
- Removed `multiword_name` / `prose_line` highlight captures.
- Added `section_heading` highlight and outline captures for `# Title`
  markers used as outline anchors.
- Rewrote `README.md` install instructions to reflect publication on the
  Zed extension registry.

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

[0.1.3]: https://github.com/dylan-gluck/zed-sudolang/releases/tag/v0.1.3
[0.1.2]: https://github.com/dylan-gluck/zed-sudolang/releases/tag/v0.1.2
[0.1.1]: https://github.com/dylan-gluck/zed-sudolang/releases/tag/v0.1.1
[0.1.0]: https://github.com/dylan-gluck/zed-sudolang/releases/tag/v0.1.0
