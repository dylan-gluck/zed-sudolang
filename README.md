# zed-sudolang

A [Zed](https://zed.dev) extension that adds SudoLang language support: syntax highlighting, outline navigation, bracket matching, indentation, and code injections. When [`sudolang-lsp`](https://github.com/dylan-gluck/sudolang-lsp) is on `$PATH`, the extension also gives you diagnostics and format-on-save.

- Source: <https://github.com/dylan-gluck/zed-sudolang>
- Grammar: <https://github.com/dylan-gluck/tree-sitter-sudolang>
- Language server: <https://github.com/dylan-gluck/sudolang-lsp>

## File types

Write SudoLang in markdown with `sudo` code fences. Use a plain `.md` file, or use `.sudo.md` to mark the file as SudoLang content.

The built-in Markdown support in Zed handles markdown files. After you install this extension, code-block injection highlights every ` ```sudo ` and ` ```SudoLang ` fence. The `sudolang-lsp` server attaches to markdown buffers to diagnose, format, and navigate the fences in place. It never touches prose.

A pure `.sudo` file registers as SudoLang, and the parser reads it as one unit.

## Install

### From the Zed extension picker

1. Open the command palette (`cmd-shift-P`).
2. Run **`zed: extensions`**.
3. Search for **SudoLang** and click **Install**.

Now open any `.sudo` file to see highlighting, outline, and bracket matching.

### Dev install (for contributors)

To work against a local checkout of this repository:

1. Clone this repository.
2. In Zed, open the command palette and run **`zed: install dev extension`**.
3. Select the cloned directory.

Zed builds the parser from the SHA pinned in `extension.toml` and installs the extension. Edits to local query files take effect after a restart.

## Features

- SudoLang **v2.2**: qualified capability names (`mcp::linear`), named arguments, guard statements (`->`), decorators (`@retry(3)`), optional chaining `?.`, nullish default `??`, spread `...`, and the pipe placeholder `_`.
- Syntax highlighting for interfaces, functions, constraints, commands, pipes, modifiers, strings, section headings, capability namespaces, and decorators.
- An outline panel with interfaces, functions, constraints, commands, and `# heading` markers.
- Bracket pair matching for `{}`, `[]`, `()`, `""`, and `` `` ``.
- Indent-on-newline after `{` and `[`.
- Vim-mode text objects for function, class, parameter, and comment scopes.
- **Diagnostics, formatting, hover, completion, and go-to-definition through `sudolang-lsp`**. This part is opt-in. See below.

## Language server

The extension registers a language server named **SudoLang LSP** and starts it on demand. It does not bundle a binary. Install [`sudolang-lsp`](https://github.com/dylan-gluck/sudolang-lsp) yourself and put it on `$PATH`:

```sh
cargo install sudolang-lsp
```

You can also download a prebuilt binary from the [sudolang-lsp releases](https://github.com/dylan-gluck/sudolang-lsp/releases) and put it on `$PATH`.

After the install, Zed starts the server when you open a `.sudo` file or a markdown file with `sudo` fences. To use the formatter, turn on format-on-save in your Zed settings:

```json
{
  "languages": {
    "SudoLang": {
      "format_on_save": "on"
    }
  }
}
```

The server gives you:

- **Diagnostics**: unbalanced braces, missing tokens, malformed modifier lists (`:foo=bar;`), broken `${}` interpolations, and a pipe-placeholder (`_`) misuse lint.
- **Formatting**: a deterministic re-indent driven by the AST. It never reorders tokens or rewrites content. It never touches the inside of a multi-line string or comment.
- **Hover**: Markdown blurbs for keywords, decorators, capability namespaces, in-document identifiers (function, interface, property, variable, parameter, and constraint), and `/command` invocations.
- **Completion**: keywords, every named declaration in the current document, and capability namespaces (`mcp::linear`). The trigger characters are `.`, `/`, `$`, `:`, and `@`.
- **Go to definition**: jumps from an identifier or a `/command` invocation to its declaration in the same file.

If `sudolang-lsp` is not on `$PATH`, the language-server launch fails with an error that points here. The rest of the extension keeps working, which covers highlighting, outline, and brackets.

## License

MIT.
