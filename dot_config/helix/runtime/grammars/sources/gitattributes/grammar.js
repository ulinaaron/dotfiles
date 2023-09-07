// rules taken from:
// * https://git-scm.com/docs/gitignore#_pattern_format
// * https://linuxize.com/post/gitignore-ignoring-files-in-git/
// * https://github.com/git/git/blob/master/wildmatch.c

const NAMED_CHARACTER_CLASSES = [
  "alnum",
  "alpha",
  "blank",
  "cntrl",
  "digit",
  "graph",
  "lower",
  "print",
  "punct",
  "space",
  "upper",
  "xdigit",
].map(name => seq("[:", field("name", name), ":]"));

module.exports = grammar({
  name: "gitattributes",
  extras: $ => [],
  rules: {
    document: $ => repeat($._line),

    _line: $ =>
      seq(
        optional(choice($.comment, $.attributes_line)),
        optional(/[ \t]+/),
        /\r?\n/
      ),

    comment: $ => /#[^\n]*/,
    
    attributes_line: $ =>
      prec.right(
        seq(
          choice($.pattern, $.quoted_pattern),
          repeat(seq(/[ \t]+/, $._attribute_declaration))
        )
      ),
    _attribute_declaration: $ =>
      choice(
        $.attribute_set,
        $.attribute_unset,
        $.attribute_set_to
      ),
    attribute_set: $ => $.attribute,
    attribute_unset: $ => seq(choice("-", "!"), $.attribute),
    attribute_set_to: $ => seq($.attribute, "=", $.value),
    
    quoted_pattern: $ => seq('"', $.pattern, '"'),

    // matches the behaviour here: https://github.com/git/git/blob/master/attr.c
    attribute: $ => /[^ \t\r\n=!-][^ \t\r\n=]*/,
    value: $ => /[^ \t\r\n]+/,

    pattern: $ =>
      seq(
        optional(alias("!", $.negation)),
        optional(field("relative_flag", $._directory_separator)),
        $._pattern,
        repeat(seq(field("relative_flag", $._directory_separator), $._pattern)),
        optional(field("directory_flag", $._directory_separator))
      ),

    _directory_separator: $ =>
      choice($.directory_separator, $.directory_separator_escaped),
    directory_separator: $ => "/",
    directory_separator_escaped: $ => "\\/",

    _pattern: $ =>
      repeat1(
        choice(
          $.pattern_char,
          $.pattern_char_escaped,
          $._wildcard,
          $.bracket_expr
        )
      ),

    pattern_char: $ => /[^ \t\r\n/*?]/,

    pattern_char_escaped: $ => seq("\\", /[^ \t\r\n/]/),

    _wildcard: $ =>
      choice(
        alias("?", $.wildcard_char_single),
        alias("*", $.wildcard_chars),
        alias("**", $.wildcard_chars_allow_slash)
      ),

    bracket_expr: $ =>
      seq(
        "[",
        optional(alias(choice("!", "^"), $.bracket_negation)),
        choice(
          seq($._bracket_pattern_closing_bracket, repeat($._bracket_pattern)),
          repeat1($._bracket_pattern)
        ),
        "]"
      ),

    _bracket_pattern: $ =>
      choice($._bracket_char, $.bracket_range, $.bracket_char_class),

    _bracket_pattern_closing_bracket: $ =>
      choice(
        $._bracket_char_closing_bracket,
        alias($._bracket_range_closing_bracket, $.bracket_range)
      ),
    _bracket_char_closing_bracket: $ => alias("]", $.bracket_char),
    _bracket_range_closing_bracket: $ =>
      seq($._bracket_char_closing_bracket, "-", $._bracket_char),

    _bracket_char: $ => choice($.bracket_char, $.bracket_char_escaped),
    bracket_char: $ => /[^ \t\r\n/\]]/,
    bracket_char_escaped: $ => seq("\\", /[^ \t\r\n/]/),

    bracket_range: $ => seq($._bracket_char, "-", $._bracket_char),

    bracket_char_class: $ => choice(...NAMED_CHARACTER_CLASSES),
  },
});
