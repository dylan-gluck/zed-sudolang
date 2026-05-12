;; SudoLang highlights for Zed. Captures use Zed's standard set.

; --- Keywords --------------------------------------------------------

[
  "fn"
  "function"
  "interface"
  "match"
  "case"
  "default"
  "if"
  "else"
  "for"
  "each"
  "in"
  "while"
  "loop"
  "return"
  "throw"
  "try"
  "catch"
  "require"
  "warn"
] @keyword

(constraint_keyword) @keyword

[
  "xor"
  "union"
  "intersection"
  "cap"
  "cup"
] @keyword.operator

; --- Literals --------------------------------------------------------

(boolean) @boolean
(null) @constant
(number) @number

(double_string) @string
(template_string) @string
(string_fragment) @string
(escape_sequence) @string.escape
(triple_quoted_block) @string

(string_interpolation) @embedded

; --- Identifiers -----------------------------------------------------

((identifier) @type
  (#match? @type "^[A-Z][a-zA-Z0-9_]*$"))

(sigil_identifier) @variable.special

(function_declaration name: (identifier) @function.definition)
(call_expression function: (identifier) @function)
(call_expression function: (member_expression property: (identifier) @function.method))

(parameter name: (identifier) @variable.parameter)
(assignment target: (identifier) @variable)

(member_expression property: (identifier) @property)
(property_declaration name: (identifier) @property)
(property_declaration name: (multiword_property) @property)
(object_property_named key: (identifier) @property)

(modifier name: (identifier) @attribute)

; --- Commands --------------------------------------------------------

(command_name) @function.special
(command_description) @comment.doc

; --- Constraints, requires, warns -----------------------------------

(constraint_inline body: (constraint_body) @comment.doc)
(require_statement body: (require_body) @comment.doc)
(warn_statement body: (warn_body) @comment.doc)

; --- Interface and constraint names ---------------------------------

(interface_declaration name: (identifier) @type.definition)
(interface_declaration name: (multiword_name) @type.definition)
(constraint_block name: (identifier) @type)

; --- Operators -------------------------------------------------------

[
  "|>"
  "=>"
  "&&"
  "||"
  "=="
  "!="
  "<="
  ">="
  "<"
  ">"
  "+"
  "-"
  "*"
  "/"
  "%"
  "^"
  ".."
  "="
  "+="
  "-="
  "*="
  "/="
  "!"
] @operator

; --- Punctuation -----------------------------------------------------

[
  ","
  ";"
  "."
  ":"
] @punctuation.delimiter

[
  "(" ")"
  "{" "}"
  "[" "]"
] @punctuation.bracket

; --- Comments --------------------------------------------------------

(line_comment) @comment
(block_comment) @comment

; --- Natural language ------------------------------------------------

(prose_line) @comment.doc
(prose) @comment.doc

; --- Markdown --------------------------------------------------------

(markdown_heading) @markup.heading
(heading_marker) @punctuation.special
(list_marker) @punctuation.special
(blockquote_marker) @punctuation.special
(blockquote_text) @markup.quote
(fence_open) @punctuation.special
(fence_close) @punctuation.special
(fence_language) @label
