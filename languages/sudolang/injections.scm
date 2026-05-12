;; Inject the appropriate grammar into fenced code blocks based on
;; their language tag. Zed will fall back gracefully if it doesn't have
;; a parser for the named language.

(fenced_code_block
  language: (fence_language) @injection.language
  content: (fence_content) @injection.content
  (#set! injection.include-children))

;; SudoLang-flavored language tags self-inject as sudolang.
((fenced_code_block
   language: (fence_language) @_lang
   content: (fence_content) @injection.content)
 (#match? @_lang "^([Ss]udo|SudoLang|sudolang|MDC|mdc)$")
 (#set! injection.language "sudolang"))
