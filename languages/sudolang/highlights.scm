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
(object_property_named key: (identifier) @property)

(modifier name: (identifier) @attribute)

; --- Commands --------------------------------------------------------

(command_name) @function.special
(command_description) @comment.doc

; --- Interface and constraint names ---------------------------------

(interface_declaration name: (identifier) @type.definition)
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

; --- Section headings ------------------------------------------------

(section_heading) @markup.heading
(heading_marker) @punctuation.special
