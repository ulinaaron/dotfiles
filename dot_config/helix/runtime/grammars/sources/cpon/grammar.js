module.exports = grammar({
  name: 'cpon',

  extras: $ => [
    /\s/,
    $.comment,
  ],

  // supertypes: $ => [
  //   $._value
  // ],

  rules: {
    document: $ => $._value,

    _value: $ => seq(
      optional($.meta),
      choice(
        $.map,
        $.imap,
        $.array,
        $.number,
        $.datetime,
        $.string,
        $.hexblob,
        $.escblob,
        $.true,
        $.false,
        $.null
      ) 
    ),

    meta: $ => seq(
      "<", commaSep($.mpair), ">"
    ),

    mpair: $ => seq(
      field("key", choice($.string, $.number)),
      ":",
      field("value", $._value)
    ),

    map: $ => seq(
      "{", commaSep($.pair), "}"
    ),

    pair: $ => seq(
      field("key", $.string),
      ":",
      field("value", $._value)
    ),

    imap: $ => seq(
      "i{", commaSep($.ipair), "}"
    ),

    ipair: $ => seq(
      field("key", $.number),
      ":",
      field("value", $._value)
    ),

    array: $ => seq(
      "[", commaSep($._value), "]"
    ),

    string: $ => choice(
      seq('"', '"'),
      seq('"', $.string_content, '"')
    ),

    string_content: $ => repeat1(choice(
      token.immediate(/[^\\"\n]+/),
      $.escape_sequence
    )),

    escape_sequence: $ => token.immediate(seq(
      '\\',
      /(\"|\\|\/|b|f|n|r|t)/
    )),

    number: $ => {
      const hex_literal = seq(
        choice('0x', '0X'),
        /[\da-fA-F]+u?/
      )
      const int_literal = /\d+u?/
      
      const decimal_digits = /\d+/
      const signed_integer = seq(optional(choice('-', '+')), decimal_digits)
      const exponent_part = seq(choice('e', 'E'), signed_integer)

      // const binary_literal = seq(choice('0b', '0B'), /[0-1]+/)

      // const octal_literal = seq(choice('0o', '0O'), /[0-7]+/)

      const decimal_integer_literal = seq(
        optional(choice('-', '+')),
        choice(
          '0',
          seq(/[1-9]/, optional(decimal_digits))
        )
      )

      const decimal_literal = choice(
        seq(decimal_integer_literal, '.', optional(decimal_digits), optional(exponent_part)),
        seq('.', decimal_digits, optional(exponent_part)),
        seq(decimal_integer_literal, optional(exponent_part))
      )

      return token(choice(
        hex_literal,
        int_literal,
        decimal_literal
        // binary_literal,
        // octal_literal
      ))
    },

    // datetime: $ => /d"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}"/,
    datetime: $ => /d"(\d{4})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])T(0[0-9]|1[0-9]|2[0123]):([012345][0-9]):([012345][0-9])(\.\d{3})?(Z|[+-](0[1-9]|1[012])([012345][0-9])?)?"/,

    true: $ => "true",
    
    hexblob: $ => /x"([0-9a-fA-F]{2})*"/,
    escblob: $ => /b"(\\[0-9a-fA-F]{2}|[ -~]|\\\\)*"/,

    false: $ => "false",

    null: $ => "null",

    comment: $ => token(choice(
      seq('//', /.*/),
      seq(
        '/*',
        /[^*]*\*+([^/*][^*]*\*+)*/,
        '/'
      )
    )),
  }
});

function commaSep1(rule) {
  return seq(rule, repeat(seq(repeat1(choice(",", "\n", " ", "\t")), rule)))
}

function commaSep(rule) {
  return optional(seq(commaSep1(rule),repeat(choice(",", "\n", " ", "\t"))))
}
