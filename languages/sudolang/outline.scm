;; SudoLang outline — interfaces, functions, constraints, commands,
;; markdown headings.

(interface_declaration
  "interface"? @context
  name: (_) @name) @item

(function_declaration
  ["fn" "function"]? @context
  name: (identifier) @name) @item

(constraint_block
  (constraint_keyword) @context
  name: (identifier)? @name) @item

(command_declaration
  command: (command_name) @name) @item

(markdown_heading
  marker: (heading_marker) @context
  text: (heading_text) @name) @item
