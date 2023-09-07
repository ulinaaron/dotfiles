# tree-sitter-edoc

_A tree-sitter grammar for the Erlang documentation generator (edoc) syntax_

### Status

`tree-sitter-edoc` is somewhat complete - it's usable but not very good yet.
Some improvements to do:

* Tags may only start on line beginnings
* Doc tags could parse the subject-line (everything before first `.`)
* Inject Erlang into `@type` and `@spec`? I lean towards no, those should be migrated into `-type` and `-spec` attributes and might be tricky to parse
* Find bugs! :bug:
