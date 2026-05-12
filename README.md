# zed-sudolang

A [Zed](https://zed.dev) extension that adds SudoLang language support: syntax highlighting, outline navigation, bracket matching, indentation, and code injections for fenced blocks.

- Source: <https://github.com/dylan-gluck/zed-sudolang>
- Grammar: <https://github.com/dylan-gluck/tree-sitter-sudolang>

## File types

Registers for `.sudo`, `.sudo.md`, and `.mdc` files.

## Install

Once published: install from the Zed extensions panel (`cmd-shift-X`).

### Dev install

In Zed, run **`zed: install dev extension`** (command palette: `cmd-shift-P`) and select this directory. Zed will fetch the grammar repo pinned in `extension.toml` and build the WASM during install.

For pre-publish testing where the grammar repo isn't on GitHub yet, you can pre-build and stage the extension manually:

```bash
# Build the grammar
cd ../tree-sitter-sudolang
npx tree-sitter generate
npx tree-sitter build --wasm

# Stage into Zed's installed-extensions directory
EXT_DIR="$HOME/Library/Application Support/Zed/extensions/installed/sudolang"
mkdir -p "$EXT_DIR/grammars" "$EXT_DIR/languages/sudolang"
cp tree-sitter-sudolang.wasm "$EXT_DIR/grammars/sudolang.wasm"
cp ../zed-sudolang/extension.toml "$EXT_DIR/extension.toml"
cp -r ../zed-sudolang/languages/sudolang/* "$EXT_DIR/languages/sudolang/"
```

Restart Zed and open any `.sudo.md` file.

## Features

- Syntax highlighting for interfaces, functions, constraints, commands, pipes, modifiers, strings, and Markdown.
- Outline panel populated with interfaces, functions, constraints, commands, and Markdown headings.
- Bracket pair matching for `{}`, `[]`, `()`, `""`, and `` `` ``.
- Indent-on-newline after `{` and `[`.
- Code injections into fenced code blocks (e.g. `mermaid`, `javascript`, `python`, `json`, and `sudolang` self-injection).
- Vim-mode text objects for function / class / parameter / comment scopes.

## License

MIT.
