# zed-sudolang

A [Zed](https://zed.dev) extension that adds [SudoLang](https://github.com/paralleldrive/sudolang-llm-support) language support: syntax highlighting, outline navigation, bracket matching, indentation, and code injections.

- Source: <https://github.com/dylan-gluck/zed-sudolang>
- Grammar: <https://github.com/dylan-gluck/tree-sitter-sudolang>

## File types

Registers `.sudo` files as SudoLang. Markdown files (`.md`, `.sudo.md`, `.mdc`) are still handled by Zed's built-in Markdown extension; SudoLang code fences inside them (` ```sudo ` / ` ```SudoLang `) are highlighted via Markdown's code-block injection once this extension is installed.

## Install

### From the Zed extension picker

1. Open the command palette (`cmd-shift-P`).
2. Run **`zed: extensions`**.
3. Search for **SudoLang** and click **Install**.

That's it — open any `.sudo` file to see highlighting, outline, and bracket matching.

### Dev install (for contributors)

To work against a local checkout of this repo:

1. Clone this repository.
2. In Zed, open the command palette and run **`zed: install dev extension`**.
3. Select the cloned directory.

Zed builds the parser from the SHA pinned in `extension.toml` and installs the extension. Edits to local query files take effect after a restart.

## Features

- Syntax highlighting for interfaces, functions, constraints, commands, pipes, modifiers, strings, and section headings.
- Outline panel populated with interfaces, functions, constraints, commands, and `# heading` markers.
- Bracket pair matching for `{}`, `[]`, `()`, `""`, and `` `` ``.
- Indent-on-newline after `{` and `[`.
- Vim-mode text objects for function / class / parameter / comment scopes.

## License

MIT.
