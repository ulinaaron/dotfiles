const int = /[0-9][0-9_]*/;

const nic = /\\\/\(\){}<>;\[\]=,"\u0000-\u0020/;
const eol = /\r?\n/;

module.exports = grammar({
  name: "kdl",

  rules: {
    document: $ => repeat(choice($.node, $.comment, eol)),

    node: $ => seq(
      optional($.node_comment_prefix), // TODO: make this actually comment the whole thing
      optional($.type),
      field("name", $.identifier),
      repeat(choice($.prop, $.value)),
      optional(field("block", $.node_block)),
      $._node_terminator
    ),
    node_block: $ => seq(
      optional($.node_comment_prefix),
      "{",
      repeat(choice($.node, $.comment, eol)),
      "}"
    ),
    node_comment_prefix: _ => "/-",
    _node_terminator: $ => choice(field("eol_comment", $.single_line_comment), ";", eol),

    identifier: $ => choice($.string, $.bare_identifier),
    bare_identifier: _ => new RegExp(`[^${nic}\\d][^${nic}]*`),
    keyword: $ => choice($.boolean, "null"),
    prop: $ => seq($.identifier, token.immediate("="), $.value),
    value: $ => seq(
        optional($.type),
        choice($.string, $.number, $.keyword)
    ),
    type: $ => seq("(", $.identifier, ")"),

    // TODO: strings
    string: $ => choice($._escaped_string),
    _escaped_string: $ => seq("\"", repeat($._char), "\""),
    _char: _ => /[^"]/,

    number: $ => choice($.decimal),
    boolean: _ => choice("true", "false"),

    decimal: $ => seq(
        $.integer,
        optional(seq(".", int)),
        optional($.exponent)
    ),
    exponent: $ => seq(choice("e", "E"), $.integer),
    integer: $ => seq(optional($.sign), int),
    sign: _ => choice("+", "-"),

    // TOOD: hex, octal, binary numbers

    // TODO: comments
    comment: $ => choice($.single_line_comment),
    single_line_comment: _ => seq("//", /[^\r\n]*/, eol),
  }
});
