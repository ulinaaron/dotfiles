module.exports = grammar({
  name: 'hosts',

  extras: $ => [/\s+/, $.comment],

  rules: {
    source_file: $ => repeat($.entry),
    entry: $ => seq($.ip, /\s+/, repeat1($.host), optional('\n')),
    ip: $ => /[.:0-9a-fA-F]+/,
    host: $ => /[.0-9a-zA-Z-]+/,
    comment: $ => /#.*/,
  }
});
