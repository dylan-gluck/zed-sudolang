;; Strings and comments form their own scopes so that brackets,
;; autoclose, and word-character behaviour adjust appropriately when
;; the cursor is inside one.

(double_string) @string
(template_string) @string
(triple_quoted_block) @string

(line_comment) @comment
(block_comment) @comment
