;; Surface "Run" affordances for test-style calls (Riteway: describe /
;; assert) and transpile invocations. The handler is the user's
;; responsibility — typically routed to an external LLM.

(call_expression
  function: (identifier) @_name
  (#eq? @_name "describe")) @run

(call_expression
  function: (identifier) @_name
  (#eq? @_name "transpile")) @run
