/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "pem",
  conflicts: $ => [[$.laxtextualmsg, $.laxtextualmsg]],
  extras: () => [],
  rules: {
    pem_file: $ => seq(repeat($.laxtextualmsg)),

    // ABNF (Lax)

    laxtextualmsg: $ => seq(
      repeat($._W),
      $.preeb,
      optional($.laxbase64text),
      $.posteb,
      repeat($._W),
    ),

    _W: $ => choice(
      $._WSP,
      $._CR,
      $._LF,
      "\u000B",
      "\u000C",
    ),

    __laxbase64text_char: $ => choice(
      $._W,
      $._base64char,
    ),

    _laxbase64text_padding: $ => seq(
      $.base64pad,
      repeat($._W),
      optional(seq(
        $.base64pad,
        repeat($._W),
      )),
    ),

    // NOTE: this doesn't correspond directly to the ABNF, which allows both
    // the characters and padding to be omitted at once, since tree-sitter
    // doesn't support rules that match the empty string. Instead, we force at
    // least one of either to be present here, and optional($.laxbase64text) is
    // used wherever laxbase64text is specified in the ABNF.
    laxbase64text: $ => choice(
      seq(
        repeat1($.__laxbase64text_char),
        optional($._laxbase64text_padding),
      ),
      $._laxbase64text_padding,
    ),

    // ABNF (Standard)

    preeb: $ => seq("-----BEGIN ", optional($.label), "-----"),

    posteb: $ => seq("-----END ", optional($.label), "-----"),

    _base64char: $ => choice($._ALPHA, $._DIGIT, "+", "/"),

    base64pad: () => "=",

    _labelchar: () => /[!-,.-~]/,

    // NOTE: this doesn't correspond directly to the ABNF, which wraps the
    // whole token in [...] since tree-sitter doesn't support rules that match
    // the empty string. Instead, that is omitted here, and optional($.label)
    // is used wherever label is specified in the ABNF.
    label: $ => seq(
      $._labelchar,
      repeat(seq(
        optional(choice("-", $._SP)),
        $._labelchar,
      )),
    ),

    _eol: $ => choice($._CRLF, $._CR, $._LF),

    _eolWSP: $ => seq($._WSP, $._CR, $._LF),

    // ABNF (Builtins)

    _ALPHA: () => /[A-Za-z]/,

    _DIGIT: () => /[0-9]/,

    _SP: () => " ",

    _HTAB: () => "\t",

    _WSP: $ => choice($._SP, $._HTAB),

    _CR: () => "\r",

    _LF: () => "\n",

    _CRLF: $ => seq($._CR, $._LF),
  },
})
