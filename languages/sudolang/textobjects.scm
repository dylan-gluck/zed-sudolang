;; Vim-mode text objects.

(function_declaration body: (block) @function.inside) @function.around
(interface_declaration body: (block) @class.inside) @class.around
(constraint_block body: (block) @class.inside) @class.around

(parameter_list (_) @parameter.inside) @parameter.around
(argument_list (_) @parameter.inside) @parameter.around

(line_comment)+ @comment.around
(block_comment) @comment.around
