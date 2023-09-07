(comment) @comment
(single_line_comment) @comment

(node
    name: (identifier) @function)
(prop (identifier) @property)
(type) @type

(keyword) @keyword

(string) @string
(number) @number
(boolean) @constant.builtin

"." @punctuation.delimiter

"=" @operator

"{" @punctuation.bracket
"}" @punctuation.bracket

; vim:ft=query
