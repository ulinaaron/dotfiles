const WHITE_SPACE = /[\x01-\x09\x11-\x20\x80-\xA0]+/;

module.exports = grammar({
  name: "edoc",

  extras: ($) => [WHITE_SPACE],

  rules: {
    source: ($) =>
      seq(repeat($._terminator), repeat(seq($._line, repeat1($._terminator)))),

    _line: ($) => choice($._separator, $.section, $._tag_line, $._text_line),

    _separator: ($) => seq("=====", /=*/),

    _tag_line: ($) =>
      choice(
        $._author_line,
        $._see_line,
        $._param_line,
        seq($.tag, optional($._text_line))
      ),

    _author_line: ($) =>
      seq(
        alias("@author", $.tag),
        repeat($._word),
        optional(alias($.xhtml_tag, $.email_address))
      ),

    _see_line: ($) => seq(alias("@see", $.tag), $.expression),

    _param_line: ($) =>
      seq(
        alias("@param", $.tag),
        alias($._word, $.parameter),
        optional($._text_line)
      ),

    _text_line: ($) =>
      repeat1(
        choice(
          $.macro,
          $._word,
          $._xhtml_tag,
          $.inline_quote,
          $.block_quote,
          $.quote_escape
        )
      ),

    section: ($) =>
      choice(section($, "=="), section($, "==="), section($, "====")),

    macro: ($) =>
      choice(
        $._link_macro,
        seq("{", $.tag, optional(seq(/\s+/, $.argument)), "}")
      ),

    tag: ($) => choice("TODO:", /@\w+/),
    argument: ($) => repeat1(choice(/[^}]/, $.macro_escape)),

    _link_macro: ($) =>
      seq(
        "{",
        alias("@link", $.tag),
        $.expression,
        optional(seq(".", alias($.argument, $.description))),
        "}"
      ),

    // Expressions, used in links and `@see` comments.
    expression: ($) =>
      choice(
        $.module,
        seq($.function, "/", $.arity),
        seq(optional(seq($.module, ":")), $.function, "/", $.arity),
        seq(optional(seq($.module, ":")), $.type, "(", ")")
      ),

    module: ($) => $._atom,
    function: ($) => $._atom,
    type: ($) => $._atom,
    arity: ($) => /\d+/,

    _xhtml_tag: ($) => choice($.em_xhtml_tag, $.strong_xhtml_tag, $.xhtml_tag),

    em_xhtml_tag: ($) => special_xhtml_tag($, "em"),
    strong_xhtml_tag: ($) => special_xhtml_tag($, "strong"),

    xhtml_tag: ($) => seq("<", repeat(/[^>]/), ">"),

    xhtml_tag_content: ($) =>
      repeat1(
        choice(
          $._word,
          $.xhtml_tag,
          $.inline_quote,
          $.quote_escape,
          $._terminator
        )
      ),

    macro_escape: ($) => choice("@{", "@}", "@@"),

    quote_escape: ($) => /`'/,

    inline_quote: ($) =>
      choice($._inline_quote, $._double_inline_quote, $._triple_inline_quote),

    _inline_quote: ($) => seq("`", /[^']+/, "'"),
    _double_inline_quote: ($) => seq("``", repeat(/([^`']|')/), "''"),
    _triple_inline_quote: ($) => seq("```", repeat(/([^'\r\n]|')/), "'''"),

    block_quote: ($) =>
      seq(
        alias("```", $.quote_marker),
        optional(field("language", $.language_identifier)),
        $.quote_content,
        alias("'''", $.quote_marker)
      ),

    language_identifier: ($) => /[\w_-]+\r?\n/,

    quote_content: ($) => repeat1(/([^']|')/),

    _terminator: ($) => /\r?\n/,

    _double_terminator: ($) => /\r?\n\r?\n+/,

    _word: ($) => token(prec(-1, /([^ \t\n\r<{`]|<\{`)+/)),

    _atom: ($) => choice($._unquoted_atom, $._quoted_atom),

    // latin1 diacritics are allowed.
    _unquoted_atom: ($) => token(/[a-zà-öø-ÿ][a-zA-ZÀ-ÿ0-9_@]*/),

    _quoted_atom: ($) =>
      seq("'", repeat(choice($._quoted_content, $._escape_sequence)), "'"),

    _escape_sequence: ($) =>
      token(
        seq(
          "\\",
          choice(
            // hexadecimal
            /x[\da-fA-F]{2}/,
            /x{[\da-fA-F]+}/,
            // octal
            /[0-7]{1,3}/,
            // control sequences,
            /\^[a-zA-Z\[\]\^_\\]/,
            // characters
            /[\x20-\x7f]/
          )
        )
      ),

    _quoted_content: ($) => /([^\\\"\']+|[\\\"\'])/,
  },
});

function sep1(rule, separator) {
  return seq(rule, repeat1(seq(separator, rule)));
}

function section($, marker) {
  return seq(
    alias(marker, $.section_marker),
    alias($._text_line, $.section_content),
    alias(marker, $.section_marker)
  );
}

function special_xhtml_tag($, tagname) {
  return seq(
    alias(`<${tagname}>`, $.open_xhtml_tag),
    $.xhtml_tag_content,
    alias(`</${tagname}>`, $.close_xhtml_tag)
  );
}
