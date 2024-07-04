; highlights.scm for Neovim
; See <https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights>

; Note: First matches apply

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ";"
  "."
  ","
] @punctuation.delimiter


[
  "*"
  "+"
  "-"
  "/"
  "||"
] @operator

[
  "true"
  "false"
] @boolean

[
  (null)
] @constant.builtin

[
  "all"
  "any"
  "as"
  "by"
  "cast"
  "distinct"
  "exists"
  "extract"
  "false"
  "from"
  "in"
  "key"
  "new"
  "not"
  "of"
  "on"
  "select"
  "some"
  "trim"
  "true"
  "where"
  "with"
  "abstract"
  "action"
  "actions"
  "and"
  "annotate"
  "annotation"
  "array"
  "asc"
  "aspect"
  "association"
  "between"
  "both"
  "composition"
  "context"
  "cross"
  "current"
  "day"
  "default"
  "define"
  "desc"
  "element"
  "else"
  "entity"
  "enum"
  "event"
  "escape"
  "exact"
  "except"
  "excluding"
  "extend"
  "first"
  "floating"
  "following"
  "full"
  "function"
  "group"
  "having"
  "hour"
  "inner"
  "intersect"
  "into"
  "is"
  "join"
  "last"
  "leading"
  "left"
  "like"
  "limit"
  "localized"
  "many"
  "masked"
  "minus"
  "minute"
  "mixin"
  "month"
  "namespace"
  "nulls"
  "offset"
  "one"
  "or"
  "order"
  "outer"
  "over"
  "parameters"
  "partition"
  "preceding"
  "projection"
  "redirected"
  "right"
  "row"
  "rows"
  "second"
  "service"
  "trailing"
  "to"
  "type"
  "union"
  "unbounded"
  "up"
  "using"
  "variable"
  "view"
  "virtual"
  "year"
] @keyword

[
  "returns"
] @keyword.return

[
  "case"
  "when"
  "then"
  "end"
] @conditional

"@" @attribute ; annotations

(comment) @comment

(from_path) @variable
(simple_path) @variable
(definition_reference) @variable
(element_reference) @variable

(identifier) @variable

(number) @number
(single_quote_string) @string
(backtick_string) @string
(text_block) @string

(namespace path: (_) @namespace)

(parameter_definition type: (_ (_ (_ (identifier) @type))))
(parameter_definition (name) @variable.parameter)

(entity_definition (name) @function)
(type_definition (name) @function)
(view_definition (name) @function)
(event_definition (name) @function)
(annotation_definition (name) @function)
(context_definition (name) @function)
(service_definition (name) @function)
(action_definition (name) @function)
(function_definition (name) @function)

(annotation_path (identifier) @attribute)
