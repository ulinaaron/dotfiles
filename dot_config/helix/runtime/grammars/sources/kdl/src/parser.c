#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 13
#define STATE_COUNT 122
#define LARGE_STATE_COUNT 15
#define SYMBOL_COUNT 45
#define ALIAS_COUNT 0
#define TOKEN_COUNT 23
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 3
#define MAX_ALIAS_SEQUENCE_LENGTH 6
#define PRODUCTION_ID_COUNT 14

enum {
  aux_sym_document_token1 = 1,
  anon_sym_LBRACE = 2,
  anon_sym_RBRACE = 3,
  sym_node_comment_prefix = 4,
  anon_sym_SEMI = 5,
  sym_bare_identifier = 6,
  anon_sym_null = 7,
  anon_sym_EQ = 8,
  anon_sym_LPAREN = 9,
  anon_sym_RPAREN = 10,
  anon_sym_DQUOTE = 11,
  sym__char = 12,
  anon_sym_true = 13,
  anon_sym_false = 14,
  anon_sym_DOT = 15,
  aux_sym_decimal_token1 = 16,
  anon_sym_e = 17,
  anon_sym_E = 18,
  anon_sym_PLUS = 19,
  anon_sym_DASH = 20,
  anon_sym_SLASH_SLASH = 21,
  aux_sym_single_line_comment_token1 = 22,
  sym_document = 23,
  sym_node = 24,
  sym_node_block = 25,
  sym__node_terminator = 26,
  sym_identifier = 27,
  sym_keyword = 28,
  sym_prop = 29,
  sym_value = 30,
  sym_type = 31,
  sym_string = 32,
  sym__escaped_string = 33,
  sym_number = 34,
  sym_boolean = 35,
  sym_decimal = 36,
  sym_exponent = 37,
  sym_integer = 38,
  sym_sign = 39,
  sym_comment = 40,
  sym_single_line_comment = 41,
  aux_sym_document_repeat1 = 42,
  aux_sym_node_repeat1 = 43,
  aux_sym__escaped_string_repeat1 = 44,
};

static const char * const ts_symbol_names[] = {
  [ts_builtin_sym_end] = "end",
  [aux_sym_document_token1] = "document_token1",
  [anon_sym_LBRACE] = "{",
  [anon_sym_RBRACE] = "}",
  [sym_node_comment_prefix] = "node_comment_prefix",
  [anon_sym_SEMI] = ";",
  [sym_bare_identifier] = "bare_identifier",
  [anon_sym_null] = "null",
  [anon_sym_EQ] = "=",
  [anon_sym_LPAREN] = "(",
  [anon_sym_RPAREN] = ")",
  [anon_sym_DQUOTE] = "\"",
  [sym__char] = "_char",
  [anon_sym_true] = "true",
  [anon_sym_false] = "false",
  [anon_sym_DOT] = ".",
  [aux_sym_decimal_token1] = "decimal_token1",
  [anon_sym_e] = "e",
  [anon_sym_E] = "E",
  [anon_sym_PLUS] = "+",
  [anon_sym_DASH] = "-",
  [anon_sym_SLASH_SLASH] = "//",
  [aux_sym_single_line_comment_token1] = "single_line_comment_token1",
  [sym_document] = "document",
  [sym_node] = "node",
  [sym_node_block] = "node_block",
  [sym__node_terminator] = "_node_terminator",
  [sym_identifier] = "identifier",
  [sym_keyword] = "keyword",
  [sym_prop] = "prop",
  [sym_value] = "value",
  [sym_type] = "type",
  [sym_string] = "string",
  [sym__escaped_string] = "_escaped_string",
  [sym_number] = "number",
  [sym_boolean] = "boolean",
  [sym_decimal] = "decimal",
  [sym_exponent] = "exponent",
  [sym_integer] = "integer",
  [sym_sign] = "sign",
  [sym_comment] = "comment",
  [sym_single_line_comment] = "single_line_comment",
  [aux_sym_document_repeat1] = "document_repeat1",
  [aux_sym_node_repeat1] = "node_repeat1",
  [aux_sym__escaped_string_repeat1] = "_escaped_string_repeat1",
};

static const TSSymbol ts_symbol_map[] = {
  [ts_builtin_sym_end] = ts_builtin_sym_end,
  [aux_sym_document_token1] = aux_sym_document_token1,
  [anon_sym_LBRACE] = anon_sym_LBRACE,
  [anon_sym_RBRACE] = anon_sym_RBRACE,
  [sym_node_comment_prefix] = sym_node_comment_prefix,
  [anon_sym_SEMI] = anon_sym_SEMI,
  [sym_bare_identifier] = sym_bare_identifier,
  [anon_sym_null] = anon_sym_null,
  [anon_sym_EQ] = anon_sym_EQ,
  [anon_sym_LPAREN] = anon_sym_LPAREN,
  [anon_sym_RPAREN] = anon_sym_RPAREN,
  [anon_sym_DQUOTE] = anon_sym_DQUOTE,
  [sym__char] = sym__char,
  [anon_sym_true] = anon_sym_true,
  [anon_sym_false] = anon_sym_false,
  [anon_sym_DOT] = anon_sym_DOT,
  [aux_sym_decimal_token1] = aux_sym_decimal_token1,
  [anon_sym_e] = anon_sym_e,
  [anon_sym_E] = anon_sym_E,
  [anon_sym_PLUS] = anon_sym_PLUS,
  [anon_sym_DASH] = anon_sym_DASH,
  [anon_sym_SLASH_SLASH] = anon_sym_SLASH_SLASH,
  [aux_sym_single_line_comment_token1] = aux_sym_single_line_comment_token1,
  [sym_document] = sym_document,
  [sym_node] = sym_node,
  [sym_node_block] = sym_node_block,
  [sym__node_terminator] = sym__node_terminator,
  [sym_identifier] = sym_identifier,
  [sym_keyword] = sym_keyword,
  [sym_prop] = sym_prop,
  [sym_value] = sym_value,
  [sym_type] = sym_type,
  [sym_string] = sym_string,
  [sym__escaped_string] = sym__escaped_string,
  [sym_number] = sym_number,
  [sym_boolean] = sym_boolean,
  [sym_decimal] = sym_decimal,
  [sym_exponent] = sym_exponent,
  [sym_integer] = sym_integer,
  [sym_sign] = sym_sign,
  [sym_comment] = sym_comment,
  [sym_single_line_comment] = sym_single_line_comment,
  [aux_sym_document_repeat1] = aux_sym_document_repeat1,
  [aux_sym_node_repeat1] = aux_sym_node_repeat1,
  [aux_sym__escaped_string_repeat1] = aux_sym__escaped_string_repeat1,
};

static const TSSymbolMetadata ts_symbol_metadata[] = {
  [ts_builtin_sym_end] = {
    .visible = false,
    .named = true,
  },
  [aux_sym_document_token1] = {
    .visible = false,
    .named = false,
  },
  [anon_sym_LBRACE] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_RBRACE] = {
    .visible = true,
    .named = false,
  },
  [sym_node_comment_prefix] = {
    .visible = true,
    .named = true,
  },
  [anon_sym_SEMI] = {
    .visible = true,
    .named = false,
  },
  [sym_bare_identifier] = {
    .visible = true,
    .named = true,
  },
  [anon_sym_null] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_EQ] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_LPAREN] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_RPAREN] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_DQUOTE] = {
    .visible = true,
    .named = false,
  },
  [sym__char] = {
    .visible = false,
    .named = true,
  },
  [anon_sym_true] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_false] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_DOT] = {
    .visible = true,
    .named = false,
  },
  [aux_sym_decimal_token1] = {
    .visible = false,
    .named = false,
  },
  [anon_sym_e] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_E] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_PLUS] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_DASH] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_SLASH_SLASH] = {
    .visible = true,
    .named = false,
  },
  [aux_sym_single_line_comment_token1] = {
    .visible = false,
    .named = false,
  },
  [sym_document] = {
    .visible = true,
    .named = true,
  },
  [sym_node] = {
    .visible = true,
    .named = true,
  },
  [sym_node_block] = {
    .visible = true,
    .named = true,
  },
  [sym__node_terminator] = {
    .visible = false,
    .named = true,
  },
  [sym_identifier] = {
    .visible = true,
    .named = true,
  },
  [sym_keyword] = {
    .visible = true,
    .named = true,
  },
  [sym_prop] = {
    .visible = true,
    .named = true,
  },
  [sym_value] = {
    .visible = true,
    .named = true,
  },
  [sym_type] = {
    .visible = true,
    .named = true,
  },
  [sym_string] = {
    .visible = true,
    .named = true,
  },
  [sym__escaped_string] = {
    .visible = false,
    .named = true,
  },
  [sym_number] = {
    .visible = true,
    .named = true,
  },
  [sym_boolean] = {
    .visible = true,
    .named = true,
  },
  [sym_decimal] = {
    .visible = true,
    .named = true,
  },
  [sym_exponent] = {
    .visible = true,
    .named = true,
  },
  [sym_integer] = {
    .visible = true,
    .named = true,
  },
  [sym_sign] = {
    .visible = true,
    .named = true,
  },
  [sym_comment] = {
    .visible = true,
    .named = true,
  },
  [sym_single_line_comment] = {
    .visible = true,
    .named = true,
  },
  [aux_sym_document_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_node_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym__escaped_string_repeat1] = {
    .visible = false,
    .named = false,
  },
};

enum {
  field_block = 1,
  field_eol_comment = 2,
  field_name = 3,
};

static const char * const ts_field_names[] = {
  [0] = NULL,
  [field_block] = "block",
  [field_eol_comment] = "eol_comment",
  [field_name] = "name",
};

static const TSFieldMapSlice ts_field_map_slices[PRODUCTION_ID_COUNT] = {
  [1] = {.index = 0, .length = 2},
  [2] = {.index = 2, .length = 1},
  [3] = {.index = 3, .length = 2},
  [4] = {.index = 5, .length = 3},
  [5] = {.index = 8, .length = 2},
  [6] = {.index = 10, .length = 3},
  [7] = {.index = 13, .length = 2},
  [8] = {.index = 15, .length = 2},
  [9] = {.index = 17, .length = 3},
  [10] = {.index = 20, .length = 3},
  [11] = {.index = 23, .length = 3},
  [12] = {.index = 26, .length = 2},
  [13] = {.index = 28, .length = 3},
};

static const TSFieldMapEntry ts_field_map_entries[] = {
  [0] =
    {field_eol_comment, 1, .inherited = true},
    {field_name, 0},
  [2] =
    {field_eol_comment, 0},
  [3] =
    {field_eol_comment, 2, .inherited = true},
    {field_name, 1},
  [5] =
    {field_block, 1},
    {field_eol_comment, 2, .inherited = true},
    {field_name, 0},
  [8] =
    {field_eol_comment, 2, .inherited = true},
    {field_name, 0},
  [10] =
    {field_block, 2},
    {field_eol_comment, 3, .inherited = true},
    {field_name, 1},
  [13] =
    {field_eol_comment, 3, .inherited = true},
    {field_name, 1},
  [15] =
    {field_eol_comment, 3, .inherited = true},
    {field_name, 2},
  [17] =
    {field_block, 2},
    {field_eol_comment, 3, .inherited = true},
    {field_name, 0},
  [20] =
    {field_block, 3},
    {field_eol_comment, 4, .inherited = true},
    {field_name, 1},
  [23] =
    {field_block, 3},
    {field_eol_comment, 4, .inherited = true},
    {field_name, 2},
  [26] =
    {field_eol_comment, 4, .inherited = true},
    {field_name, 2},
  [28] =
    {field_block, 4},
    {field_eol_comment, 5, .inherited = true},
    {field_name, 2},
};

static const TSSymbol ts_alias_sequences[PRODUCTION_ID_COUNT][MAX_ALIAS_SEQUENCE_LENGTH] = {
  [0] = {0},
};

static const uint16_t ts_non_terminal_alias_map[] = {
  0,
};

static inline bool sym_bare_identifier_character_set_1(int32_t c) {
  return (c < '/'
    ? (c < ')'
      ? (c < 0
        ? c == 0
        : c <= 31)
      : (c <= ')' || c == ','))
    : (c <= '9' || (c < '{'
      ? (c < '['
        ? (c >= ';' && c <= '>')
        : c <= ']')
      : (c <= '{' || c == '}'))));
}

static inline bool sym_bare_identifier_character_set_2(int32_t c) {
  return (c < '/'
    ? (c < '"'
      ? (c < 0
        ? c == 0
        : c <= ' ')
      : (c <= '"' || (c < ','
        ? (c >= '(' && c <= ')')
        : c <= ',')))
    : (c <= '/' || (c < '{'
      ? (c < '['
        ? (c >= ';' && c <= '>')
        : c <= ']')
      : (c <= '{' || c == '}'))));
}

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(22);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == ')') ADVANCE(46);
      if (lookahead == '+') ADVANCE(59);
      if (lookahead == '-') ADVANCE(61);
      if (lookahead == '.') ADVANCE(54);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == '=') ADVANCE(44);
      if (lookahead == 'E') ADVANCE(57);
      if (lookahead == 'e') ADVANCE(56);
      if (lookahead == 'f') ADVANCE(31);
      if (lookahead == 'n') ADVANCE(40);
      if (lookahead == 't') ADVANCE(37);
      if (lookahead == '{') ADVANCE(27);
      if (lookahead == '}') ADVANCE(28);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') SKIP(21)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ',' &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead)) ADVANCE(41);
      END_STATE();
    case 1:
      if (lookahead == '\n') ADVANCE(23);
      if (lookahead == '\r') ADVANCE(1);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == '}') ADVANCE(28);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(1)
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ')' &&
          lookahead != ',' &&
          (lookahead < '0' || '9' < lookahead) &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead) &&
          lookahead != '{') ADVANCE(41);
      END_STATE();
    case 2:
      if (lookahead == '\n') ADVANCE(24);
      if (lookahead == '\r') ADVANCE(3);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '+') ADVANCE(59);
      if (lookahead == '-') ADVANCE(61);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == '=') ADVANCE(44);
      if (lookahead == 'f') ADVANCE(31);
      if (lookahead == 'n') ADVANCE(40);
      if (lookahead == 't') ADVANCE(37);
      if (lookahead == '{') ADVANCE(27);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(3)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ')' &&
          lookahead != ',' &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead) &&
          lookahead != '}') ADVANCE(41);
      END_STATE();
    case 3:
      if (lookahead == '\n') ADVANCE(24);
      if (lookahead == '\r') ADVANCE(3);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '+') ADVANCE(59);
      if (lookahead == '-') ADVANCE(61);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == 'f') ADVANCE(31);
      if (lookahead == 'n') ADVANCE(40);
      if (lookahead == 't') ADVANCE(37);
      if (lookahead == '{') ADVANCE(27);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(3)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ')' &&
          lookahead != ',' &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead) &&
          lookahead != '}') ADVANCE(41);
      END_STATE();
    case 4:
      if (lookahead == '\n') ADVANCE(25);
      if (lookahead == '\r') ADVANCE(4);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '+') ADVANCE(59);
      if (lookahead == '-') ADVANCE(61);
      if (lookahead == '.') ADVANCE(54);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == 'E') ADVANCE(57);
      if (lookahead == 'e') ADVANCE(56);
      if (lookahead == 'f') ADVANCE(31);
      if (lookahead == 'n') ADVANCE(40);
      if (lookahead == 't') ADVANCE(37);
      if (lookahead == '{') ADVANCE(27);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(4)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ')' &&
          lookahead != ',' &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead) &&
          lookahead != '}') ADVANCE(41);
      END_STATE();
    case 5:
      if (lookahead == '\n') ADVANCE(26);
      if (lookahead == '\r') ADVANCE(5);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '+') ADVANCE(59);
      if (lookahead == '-') ADVANCE(61);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == 'E') ADVANCE(57);
      if (lookahead == 'e') ADVANCE(56);
      if (lookahead == 'f') ADVANCE(31);
      if (lookahead == 'n') ADVANCE(40);
      if (lookahead == 't') ADVANCE(37);
      if (lookahead == '{') ADVANCE(27);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(5)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ')' &&
          lookahead != ',' &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead) &&
          lookahead != '}') ADVANCE(41);
      END_STATE();
    case 6:
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '+') ADVANCE(58);
      if (lookahead == '-') ADVANCE(60);
      if (lookahead == 'f') ADVANCE(10);
      if (lookahead == 'n') ADVANCE(19);
      if (lookahead == 't') ADVANCE(16);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') SKIP(6)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      END_STATE();
    case 7:
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') SKIP(7)
      if (!sym_bare_identifier_character_set_1(lookahead)) ADVANCE(41);
      END_STATE();
    case 8:
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') ADVANCE(49);
      if (lookahead != 0) ADVANCE(48);
      END_STATE();
    case 9:
      if (lookahead == '-') ADVANCE(29);
      if (lookahead == '/') ADVANCE(62);
      END_STATE();
    case 10:
      if (lookahead == 'a') ADVANCE(13);
      END_STATE();
    case 11:
      if (lookahead == 'e') ADVANCE(50);
      END_STATE();
    case 12:
      if (lookahead == 'e') ADVANCE(52);
      END_STATE();
    case 13:
      if (lookahead == 'l') ADVANCE(17);
      END_STATE();
    case 14:
      if (lookahead == 'l') ADVANCE(42);
      END_STATE();
    case 15:
      if (lookahead == 'l') ADVANCE(14);
      END_STATE();
    case 16:
      if (lookahead == 'r') ADVANCE(18);
      END_STATE();
    case 17:
      if (lookahead == 's') ADVANCE(12);
      END_STATE();
    case 18:
      if (lookahead == 'u') ADVANCE(11);
      END_STATE();
    case 19:
      if (lookahead == 'u') ADVANCE(15);
      END_STATE();
    case 20:
      if (eof) ADVANCE(22);
      if (lookahead == '\n') ADVANCE(23);
      if (lookahead == '\r') ADVANCE(1);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == '}') ADVANCE(28);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(20)
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ')' &&
          lookahead != ',' &&
          (lookahead < '0' || '9' < lookahead) &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead) &&
          lookahead != '{') ADVANCE(41);
      END_STATE();
    case 21:
      if (eof) ADVANCE(22);
      if (lookahead == '"') ADVANCE(47);
      if (lookahead == '(') ADVANCE(45);
      if (lookahead == ')') ADVANCE(46);
      if (lookahead == '+') ADVANCE(59);
      if (lookahead == '-') ADVANCE(61);
      if (lookahead == '.') ADVANCE(54);
      if (lookahead == '/') ADVANCE(9);
      if (lookahead == ';') ADVANCE(30);
      if (lookahead == 'E') ADVANCE(57);
      if (lookahead == 'e') ADVANCE(56);
      if (lookahead == 'f') ADVANCE(31);
      if (lookahead == 'n') ADVANCE(40);
      if (lookahead == 't') ADVANCE(37);
      if (lookahead == '{') ADVANCE(27);
      if (lookahead == '}') ADVANCE(28);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') SKIP(21)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(55);
      if (lookahead != 0 &&
          lookahead > 31 &&
          lookahead != ',' &&
          (lookahead < '<' || '>' < lookahead) &&
          (lookahead < '[' || ']' < lookahead)) ADVANCE(41);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(ts_builtin_sym_end);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(aux_sym_document_token1);
      if (lookahead == '\n') ADVANCE(23);
      if (lookahead == '\r') ADVANCE(1);
      END_STATE();
    case 24:
      ACCEPT_TOKEN(aux_sym_document_token1);
      if (lookahead == '\n') ADVANCE(24);
      if (lookahead == '\r') ADVANCE(3);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(aux_sym_document_token1);
      if (lookahead == '\n') ADVANCE(25);
      if (lookahead == '\r') ADVANCE(4);
      END_STATE();
    case 26:
      ACCEPT_TOKEN(aux_sym_document_token1);
      if (lookahead == '\n') ADVANCE(26);
      if (lookahead == '\r') ADVANCE(5);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(anon_sym_LBRACE);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(anon_sym_RBRACE);
      END_STATE();
    case 29:
      ACCEPT_TOKEN(sym_node_comment_prefix);
      END_STATE();
    case 30:
      ACCEPT_TOKEN(anon_sym_SEMI);
      END_STATE();
    case 31:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'a') ADVANCE(34);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 32:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'e') ADVANCE(51);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 33:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'e') ADVANCE(53);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 34:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'l') ADVANCE(38);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 35:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'l') ADVANCE(43);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 36:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'l') ADVANCE(35);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 37:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'r') ADVANCE(39);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 38:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 's') ADVANCE(33);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 39:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'u') ADVANCE(32);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 40:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (lookahead == 'u') ADVANCE(36);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 41:
      ACCEPT_TOKEN(sym_bare_identifier);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 42:
      ACCEPT_TOKEN(anon_sym_null);
      END_STATE();
    case 43:
      ACCEPT_TOKEN(anon_sym_null);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 44:
      ACCEPT_TOKEN(anon_sym_EQ);
      END_STATE();
    case 45:
      ACCEPT_TOKEN(anon_sym_LPAREN);
      END_STATE();
    case 46:
      ACCEPT_TOKEN(anon_sym_RPAREN);
      END_STATE();
    case 47:
      ACCEPT_TOKEN(anon_sym_DQUOTE);
      END_STATE();
    case 48:
      ACCEPT_TOKEN(sym__char);
      END_STATE();
    case 49:
      ACCEPT_TOKEN(sym__char);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') ADVANCE(49);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(48);
      END_STATE();
    case 50:
      ACCEPT_TOKEN(anon_sym_true);
      END_STATE();
    case 51:
      ACCEPT_TOKEN(anon_sym_true);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 52:
      ACCEPT_TOKEN(anon_sym_false);
      END_STATE();
    case 53:
      ACCEPT_TOKEN(anon_sym_false);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 54:
      ACCEPT_TOKEN(anon_sym_DOT);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 55:
      ACCEPT_TOKEN(aux_sym_decimal_token1);
      if (('0' <= lookahead && lookahead <= '9') ||
          lookahead == '_') ADVANCE(55);
      END_STATE();
    case 56:
      ACCEPT_TOKEN(anon_sym_e);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 57:
      ACCEPT_TOKEN(anon_sym_E);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 58:
      ACCEPT_TOKEN(anon_sym_PLUS);
      END_STATE();
    case 59:
      ACCEPT_TOKEN(anon_sym_PLUS);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 60:
      ACCEPT_TOKEN(anon_sym_DASH);
      END_STATE();
    case 61:
      ACCEPT_TOKEN(anon_sym_DASH);
      if (!sym_bare_identifier_character_set_2(lookahead)) ADVANCE(41);
      END_STATE();
    case 62:
      ACCEPT_TOKEN(anon_sym_SLASH_SLASH);
      END_STATE();
    case 63:
      ACCEPT_TOKEN(aux_sym_single_line_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(63);
      if (lookahead != 0 &&
          lookahead != '\n' &&
          lookahead != '\r') ADVANCE(64);
      END_STATE();
    case 64:
      ACCEPT_TOKEN(aux_sym_single_line_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n' &&
          lookahead != '\r') ADVANCE(64);
      END_STATE();
    default:
      return false;
  }
}

static const TSLexMode ts_lex_modes[STATE_COUNT] = {
  [0] = {.lex_state = 0},
  [1] = {.lex_state = 20},
  [2] = {.lex_state = 2},
  [3] = {.lex_state = 2},
  [4] = {.lex_state = 2},
  [5] = {.lex_state = 2},
  [6] = {.lex_state = 2},
  [7] = {.lex_state = 2},
  [8] = {.lex_state = 2},
  [9] = {.lex_state = 2},
  [10] = {.lex_state = 2},
  [11] = {.lex_state = 2},
  [12] = {.lex_state = 2},
  [13] = {.lex_state = 2},
  [14] = {.lex_state = 2},
  [15] = {.lex_state = 6},
  [16] = {.lex_state = 4},
  [17] = {.lex_state = 5},
  [18] = {.lex_state = 4},
  [19] = {.lex_state = 4},
  [20] = {.lex_state = 2},
  [21] = {.lex_state = 6},
  [22] = {.lex_state = 2},
  [23] = {.lex_state = 20},
  [24] = {.lex_state = 2},
  [25] = {.lex_state = 20},
  [26] = {.lex_state = 20},
  [27] = {.lex_state = 20},
  [28] = {.lex_state = 20},
  [29] = {.lex_state = 20},
  [30] = {.lex_state = 20},
  [31] = {.lex_state = 2},
  [32] = {.lex_state = 2},
  [33] = {.lex_state = 2},
  [34] = {.lex_state = 2},
  [35] = {.lex_state = 2},
  [36] = {.lex_state = 2},
  [37] = {.lex_state = 2},
  [38] = {.lex_state = 2},
  [39] = {.lex_state = 2},
  [40] = {.lex_state = 2},
  [41] = {.lex_state = 2},
  [42] = {.lex_state = 2},
  [43] = {.lex_state = 2},
  [44] = {.lex_state = 20},
  [45] = {.lex_state = 20},
  [46] = {.lex_state = 7},
  [47] = {.lex_state = 20},
  [48] = {.lex_state = 20},
  [49] = {.lex_state = 20},
  [50] = {.lex_state = 20},
  [51] = {.lex_state = 20},
  [52] = {.lex_state = 20},
  [53] = {.lex_state = 20},
  [54] = {.lex_state = 20},
  [55] = {.lex_state = 20},
  [56] = {.lex_state = 20},
  [57] = {.lex_state = 20},
  [58] = {.lex_state = 20},
  [59] = {.lex_state = 7},
  [60] = {.lex_state = 20},
  [61] = {.lex_state = 20},
  [62] = {.lex_state = 20},
  [63] = {.lex_state = 20},
  [64] = {.lex_state = 20},
  [65] = {.lex_state = 20},
  [66] = {.lex_state = 20},
  [67] = {.lex_state = 6},
  [68] = {.lex_state = 20},
  [69] = {.lex_state = 20},
  [70] = {.lex_state = 20},
  [71] = {.lex_state = 20},
  [72] = {.lex_state = 20},
  [73] = {.lex_state = 20},
  [74] = {.lex_state = 20},
  [75] = {.lex_state = 20},
  [76] = {.lex_state = 20},
  [77] = {.lex_state = 20},
  [78] = {.lex_state = 7},
  [79] = {.lex_state = 20},
  [80] = {.lex_state = 7},
  [81] = {.lex_state = 7},
  [82] = {.lex_state = 20},
  [83] = {.lex_state = 7},
  [84] = {.lex_state = 20},
  [85] = {.lex_state = 7},
  [86] = {.lex_state = 20},
  [87] = {.lex_state = 20},
  [88] = {.lex_state = 20},
  [89] = {.lex_state = 20},
  [90] = {.lex_state = 6},
  [91] = {.lex_state = 7},
  [92] = {.lex_state = 20},
  [93] = {.lex_state = 20},
  [94] = {.lex_state = 20},
  [95] = {.lex_state = 20},
  [96] = {.lex_state = 20},
  [97] = {.lex_state = 8},
  [98] = {.lex_state = 20},
  [99] = {.lex_state = 8},
  [100] = {.lex_state = 20},
  [101] = {.lex_state = 8},
  [102] = {.lex_state = 8},
  [103] = {.lex_state = 8},
  [104] = {.lex_state = 7},
  [105] = {.lex_state = 63},
  [106] = {.lex_state = 0},
  [107] = {.lex_state = 0},
  [108] = {.lex_state = 20},
  [109] = {.lex_state = 0},
  [110] = {.lex_state = 63},
  [111] = {.lex_state = 0},
  [112] = {.lex_state = 0},
  [113] = {.lex_state = 0},
  [114] = {.lex_state = 0},
  [115] = {.lex_state = 0},
  [116] = {.lex_state = 20},
  [117] = {.lex_state = 0},
  [118] = {.lex_state = 0},
  [119] = {.lex_state = 0},
  [120] = {.lex_state = 0},
  [121] = {.lex_state = 0},
};

static const uint16_t ts_parse_table[LARGE_STATE_COUNT][SYMBOL_COUNT] = {
  [0] = {
    [ts_builtin_sym_end] = ACTIONS(1),
    [anon_sym_LBRACE] = ACTIONS(1),
    [anon_sym_RBRACE] = ACTIONS(1),
    [sym_node_comment_prefix] = ACTIONS(1),
    [anon_sym_SEMI] = ACTIONS(1),
    [sym_bare_identifier] = ACTIONS(1),
    [anon_sym_null] = ACTIONS(1),
    [anon_sym_EQ] = ACTIONS(1),
    [anon_sym_LPAREN] = ACTIONS(1),
    [anon_sym_RPAREN] = ACTIONS(1),
    [anon_sym_DQUOTE] = ACTIONS(1),
    [anon_sym_true] = ACTIONS(1),
    [anon_sym_false] = ACTIONS(1),
    [anon_sym_DOT] = ACTIONS(1),
    [aux_sym_decimal_token1] = ACTIONS(1),
    [anon_sym_e] = ACTIONS(1),
    [anon_sym_E] = ACTIONS(1),
    [anon_sym_PLUS] = ACTIONS(1),
    [anon_sym_DASH] = ACTIONS(1),
    [anon_sym_SLASH_SLASH] = ACTIONS(1),
  },
  [1] = {
    [sym_document] = STATE(121),
    [sym_node] = STATE(23),
    [sym_identifier] = STATE(9),
    [sym_type] = STATE(85),
    [sym_string] = STATE(22),
    [sym__escaped_string] = STATE(32),
    [sym_comment] = STATE(23),
    [sym_single_line_comment] = STATE(65),
    [aux_sym_document_repeat1] = STATE(23),
    [ts_builtin_sym_end] = ACTIONS(3),
    [aux_sym_document_token1] = ACTIONS(5),
    [sym_node_comment_prefix] = ACTIONS(7),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_LPAREN] = ACTIONS(11),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [2] = {
    [sym_node_block] = STATE(88),
    [sym__node_terminator] = STATE(58),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(47),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(17),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(23),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [3] = {
    [sym_node_block] = STATE(87),
    [sym__node_terminator] = STATE(72),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(7),
    [sym_value] = STATE(7),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(45),
    [aux_sym_node_repeat1] = STATE(7),
    [aux_sym_document_token1] = ACTIONS(35),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(37),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(39),
  },
  [4] = {
    [sym_node_block] = STATE(82),
    [sym__node_terminator] = STATE(74),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(8),
    [sym_value] = STATE(8),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(45),
    [aux_sym_node_repeat1] = STATE(8),
    [aux_sym_document_token1] = ACTIONS(41),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(43),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(39),
  },
  [5] = {
    [sym_node_block] = STATE(89),
    [sym__node_terminator] = STATE(50),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(45),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(45),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(47),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(39),
  },
  [6] = {
    [sym_node_block] = STATE(84),
    [sym__node_terminator] = STATE(56),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(5),
    [sym_value] = STATE(5),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(45),
    [aux_sym_node_repeat1] = STATE(5),
    [aux_sym_document_token1] = ACTIONS(49),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(51),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(39),
  },
  [7] = {
    [sym_node_block] = STATE(77),
    [sym__node_terminator] = STATE(57),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(45),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(53),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(55),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(39),
  },
  [8] = {
    [sym_node_block] = STATE(95),
    [sym__node_terminator] = STATE(44),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(45),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(57),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(59),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(39),
  },
  [9] = {
    [sym_node_block] = STATE(79),
    [sym__node_terminator] = STATE(68),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(2),
    [sym_value] = STATE(2),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(47),
    [aux_sym_node_repeat1] = STATE(2),
    [aux_sym_document_token1] = ACTIONS(61),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(63),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [10] = {
    [sym_node_block] = STATE(92),
    [sym__node_terminator] = STATE(73),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(47),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(65),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(67),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [11] = {
    [sym_node_block] = STATE(94),
    [sym__node_terminator] = STATE(64),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(10),
    [sym_value] = STATE(10),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(47),
    [aux_sym_node_repeat1] = STATE(10),
    [aux_sym_document_token1] = ACTIONS(69),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(71),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [12] = {
    [sym_node_block] = STATE(86),
    [sym__node_terminator] = STATE(49),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(13),
    [sym_value] = STATE(13),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(47),
    [aux_sym_node_repeat1] = STATE(13),
    [aux_sym_document_token1] = ACTIONS(73),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(75),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [13] = {
    [sym_node_block] = STATE(93),
    [sym__node_terminator] = STATE(62),
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [sym_single_line_comment] = STATE(47),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(77),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_node_comment_prefix] = ACTIONS(21),
    [anon_sym_SEMI] = ACTIONS(79),
    [sym_bare_identifier] = ACTIONS(9),
    [anon_sym_null] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(27),
    [anon_sym_DQUOTE] = ACTIONS(13),
    [anon_sym_true] = ACTIONS(29),
    [anon_sym_false] = ACTIONS(29),
    [aux_sym_decimal_token1] = ACTIONS(31),
    [anon_sym_PLUS] = ACTIONS(33),
    [anon_sym_DASH] = ACTIONS(33),
    [anon_sym_SLASH_SLASH] = ACTIONS(15),
  },
  [14] = {
    [sym_identifier] = STATE(113),
    [sym_keyword] = STATE(35),
    [sym_prop] = STATE(14),
    [sym_value] = STATE(14),
    [sym_type] = STATE(21),
    [sym_string] = STATE(20),
    [sym__escaped_string] = STATE(32),
    [sym_number] = STATE(35),
    [sym_boolean] = STATE(40),
    [sym_decimal] = STATE(37),
    [sym_integer] = STATE(16),
    [sym_sign] = STATE(118),
    [aux_sym_node_repeat1] = STATE(14),
    [aux_sym_document_token1] = ACTIONS(81),
    [anon_sym_LBRACE] = ACTIONS(83),
    [sym_node_comment_prefix] = ACTIONS(83),
    [anon_sym_SEMI] = ACTIONS(83),
    [sym_bare_identifier] = ACTIONS(85),
    [anon_sym_null] = ACTIONS(88),
    [anon_sym_LPAREN] = ACTIONS(91),
    [anon_sym_DQUOTE] = ACTIONS(94),
    [anon_sym_true] = ACTIONS(97),
    [anon_sym_false] = ACTIONS(97),
    [aux_sym_decimal_token1] = ACTIONS(100),
    [anon_sym_PLUS] = ACTIONS(103),
    [anon_sym_DASH] = ACTIONS(103),
    [anon_sym_SLASH_SLASH] = ACTIONS(83),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 14,
    ACTIONS(106), 1,
      anon_sym_null,
    ACTIONS(108), 1,
      anon_sym_LPAREN,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(114), 1,
      aux_sym_decimal_token1,
    STATE(16), 1,
      sym_integer,
    STATE(21), 1,
      sym_type,
    STATE(32), 1,
      sym__escaped_string,
    STATE(37), 1,
      sym_decimal,
    STATE(39), 1,
      sym_value,
    STATE(40), 1,
      sym_boolean,
    STATE(118), 1,
      sym_sign,
    ACTIONS(112), 2,
      anon_sym_true,
      anon_sym_false,
    ACTIONS(116), 2,
      anon_sym_PLUS,
      anon_sym_DASH,
    STATE(35), 3,
      sym_keyword,
      sym_string,
      sym_number,
  [47] = 5,
    ACTIONS(118), 1,
      aux_sym_document_token1,
    ACTIONS(122), 1,
      anon_sym_DOT,
    STATE(43), 1,
      sym_exponent,
    ACTIONS(124), 2,
      anon_sym_e,
      anon_sym_E,
    ACTIONS(120), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [76] = 4,
    ACTIONS(126), 1,
      aux_sym_document_token1,
    STATE(36), 1,
      sym_exponent,
    ACTIONS(124), 2,
      anon_sym_e,
      anon_sym_E,
    ACTIONS(128), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [102] = 2,
    ACTIONS(130), 1,
      aux_sym_document_token1,
    ACTIONS(132), 16,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      anon_sym_DOT,
      aux_sym_decimal_token1,
      anon_sym_e,
      anon_sym_E,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [124] = 2,
    ACTIONS(134), 1,
      aux_sym_document_token1,
    ACTIONS(136), 16,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      anon_sym_DOT,
      aux_sym_decimal_token1,
      anon_sym_e,
      anon_sym_E,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [146] = 3,
    ACTIONS(138), 1,
      aux_sym_document_token1,
    ACTIONS(142), 1,
      anon_sym_EQ,
    ACTIONS(140), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [168] = 11,
    ACTIONS(106), 1,
      anon_sym_null,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(114), 1,
      aux_sym_decimal_token1,
    STATE(16), 1,
      sym_integer,
    STATE(32), 1,
      sym__escaped_string,
    STATE(37), 1,
      sym_decimal,
    STATE(40), 1,
      sym_boolean,
    STATE(118), 1,
      sym_sign,
    ACTIONS(112), 2,
      anon_sym_true,
      anon_sym_false,
    ACTIONS(116), 2,
      anon_sym_PLUS,
      anon_sym_DASH,
    STATE(34), 3,
      sym_keyword,
      sym_string,
      sym_number,
  [206] = 2,
    ACTIONS(142), 2,
      aux_sym_document_token1,
      anon_sym_EQ,
    ACTIONS(144), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [226] = 13,
    ACTIONS(7), 1,
      sym_node_comment_prefix,
    ACTIONS(9), 1,
      sym_bare_identifier,
    ACTIONS(11), 1,
      anon_sym_LPAREN,
    ACTIONS(13), 1,
      anon_sym_DQUOTE,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(146), 1,
      ts_builtin_sym_end,
    ACTIONS(148), 1,
      aux_sym_document_token1,
    STATE(9), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(65), 1,
      sym_single_line_comment,
    STATE(85), 1,
      sym_type,
    STATE(29), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [268] = 2,
    ACTIONS(150), 2,
      aux_sym_document_token1,
      anon_sym_EQ,
    ACTIONS(152), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [288] = 13,
    ACTIONS(9), 1,
      sym_bare_identifier,
    ACTIONS(11), 1,
      anon_sym_LPAREN,
    ACTIONS(13), 1,
      anon_sym_DQUOTE,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(154), 1,
      aux_sym_document_token1,
    ACTIONS(156), 1,
      anon_sym_RBRACE,
    ACTIONS(158), 1,
      sym_node_comment_prefix,
    STATE(4), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(75), 1,
      sym_single_line_comment,
    STATE(80), 1,
      sym_type,
    STATE(30), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [330] = 13,
    ACTIONS(160), 1,
      aux_sym_document_token1,
    ACTIONS(163), 1,
      anon_sym_RBRACE,
    ACTIONS(165), 1,
      sym_node_comment_prefix,
    ACTIONS(168), 1,
      sym_bare_identifier,
    ACTIONS(171), 1,
      anon_sym_LPAREN,
    ACTIONS(174), 1,
      anon_sym_DQUOTE,
    ACTIONS(177), 1,
      anon_sym_SLASH_SLASH,
    STATE(4), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(75), 1,
      sym_single_line_comment,
    STATE(80), 1,
      sym_type,
    STATE(26), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [372] = 13,
    ACTIONS(9), 1,
      sym_bare_identifier,
    ACTIONS(11), 1,
      anon_sym_LPAREN,
    ACTIONS(13), 1,
      anon_sym_DQUOTE,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(158), 1,
      sym_node_comment_prefix,
    ACTIONS(180), 1,
      aux_sym_document_token1,
    ACTIONS(182), 1,
      anon_sym_RBRACE,
    STATE(4), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(75), 1,
      sym_single_line_comment,
    STATE(80), 1,
      sym_type,
    STATE(28), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [414] = 13,
    ACTIONS(9), 1,
      sym_bare_identifier,
    ACTIONS(11), 1,
      anon_sym_LPAREN,
    ACTIONS(13), 1,
      anon_sym_DQUOTE,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(156), 1,
      anon_sym_RBRACE,
    ACTIONS(158), 1,
      sym_node_comment_prefix,
    ACTIONS(184), 1,
      aux_sym_document_token1,
    STATE(4), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(75), 1,
      sym_single_line_comment,
    STATE(80), 1,
      sym_type,
    STATE(26), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [456] = 13,
    ACTIONS(168), 1,
      sym_bare_identifier,
    ACTIONS(171), 1,
      anon_sym_LPAREN,
    ACTIONS(174), 1,
      anon_sym_DQUOTE,
    ACTIONS(186), 1,
      ts_builtin_sym_end,
    ACTIONS(188), 1,
      aux_sym_document_token1,
    ACTIONS(191), 1,
      sym_node_comment_prefix,
    ACTIONS(194), 1,
      anon_sym_SLASH_SLASH,
    STATE(9), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(65), 1,
      sym_single_line_comment,
    STATE(85), 1,
      sym_type,
    STATE(29), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [498] = 13,
    ACTIONS(9), 1,
      sym_bare_identifier,
    ACTIONS(11), 1,
      anon_sym_LPAREN,
    ACTIONS(13), 1,
      anon_sym_DQUOTE,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(158), 1,
      sym_node_comment_prefix,
    ACTIONS(184), 1,
      aux_sym_document_token1,
    ACTIONS(197), 1,
      anon_sym_RBRACE,
    STATE(4), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(75), 1,
      sym_single_line_comment,
    STATE(80), 1,
      sym_type,
    STATE(26), 3,
      sym_node,
      sym_comment,
      aux_sym_document_repeat1,
  [540] = 2,
    ACTIONS(199), 2,
      aux_sym_document_token1,
      anon_sym_EQ,
    ACTIONS(201), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [560] = 2,
    ACTIONS(203), 2,
      aux_sym_document_token1,
      anon_sym_EQ,
    ACTIONS(205), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [580] = 2,
    ACTIONS(207), 1,
      aux_sym_document_token1,
    ACTIONS(209), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [599] = 2,
    ACTIONS(211), 1,
      aux_sym_document_token1,
    ACTIONS(213), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [618] = 2,
    ACTIONS(138), 1,
      aux_sym_document_token1,
    ACTIONS(140), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [637] = 2,
    ACTIONS(215), 1,
      aux_sym_document_token1,
    ACTIONS(217), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [656] = 2,
    ACTIONS(219), 1,
      aux_sym_document_token1,
    ACTIONS(221), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [675] = 2,
    ACTIONS(223), 1,
      aux_sym_document_token1,
    ACTIONS(225), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [694] = 2,
    ACTIONS(227), 1,
      aux_sym_document_token1,
    ACTIONS(229), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [713] = 2,
    ACTIONS(231), 1,
      aux_sym_document_token1,
    ACTIONS(233), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [732] = 2,
    ACTIONS(130), 1,
      aux_sym_document_token1,
    ACTIONS(132), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [751] = 2,
    ACTIONS(134), 1,
      aux_sym_document_token1,
    ACTIONS(136), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [770] = 2,
    ACTIONS(235), 1,
      aux_sym_document_token1,
    ACTIONS(237), 13,
      anon_sym_LBRACE,
      sym_node_comment_prefix,
      anon_sym_SEMI,
      sym_bare_identifier,
      anon_sym_null,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
      anon_sym_SLASH_SLASH,
  [789] = 2,
    ACTIONS(239), 1,
      aux_sym_document_token1,
    ACTIONS(241), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [801] = 2,
    ACTIONS(243), 1,
      aux_sym_document_token1,
    ACTIONS(245), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [813] = 7,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(247), 1,
      sym_bare_identifier,
    ACTIONS(249), 1,
      anon_sym_LPAREN,
    STATE(3), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(83), 1,
      sym_type,
  [835] = 2,
    ACTIONS(243), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(245), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [847] = 2,
    ACTIONS(251), 1,
      aux_sym_document_token1,
    ACTIONS(253), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [859] = 2,
    ACTIONS(255), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(257), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [871] = 2,
    ACTIONS(259), 1,
      aux_sym_document_token1,
    ACTIONS(261), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [883] = 2,
    ACTIONS(263), 1,
      aux_sym_document_token1,
    ACTIONS(265), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [895] = 2,
    ACTIONS(267), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(269), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [907] = 2,
    ACTIONS(271), 1,
      aux_sym_document_token1,
    ACTIONS(273), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [919] = 2,
    ACTIONS(275), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(277), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [931] = 2,
    ACTIONS(279), 1,
      aux_sym_document_token1,
    ACTIONS(281), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [943] = 2,
    ACTIONS(283), 1,
      aux_sym_document_token1,
    ACTIONS(285), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [955] = 2,
    ACTIONS(287), 1,
      aux_sym_document_token1,
    ACTIONS(289), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [967] = 2,
    ACTIONS(239), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(241), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [979] = 7,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(247), 1,
      sym_bare_identifier,
    ACTIONS(249), 1,
      anon_sym_LPAREN,
    STATE(12), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
    STATE(91), 1,
      sym_type,
  [1001] = 2,
    ACTIONS(291), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(293), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1013] = 2,
    ACTIONS(291), 1,
      aux_sym_document_token1,
    ACTIONS(293), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1025] = 2,
    ACTIONS(287), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(289), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1037] = 2,
    ACTIONS(275), 1,
      aux_sym_document_token1,
    ACTIONS(277), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1049] = 2,
    ACTIONS(283), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(285), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1061] = 2,
    ACTIONS(295), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(297), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1073] = 2,
    ACTIONS(267), 1,
      aux_sym_document_token1,
    ACTIONS(269), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1085] = 1,
    ACTIONS(299), 7,
      anon_sym_null,
      anon_sym_DQUOTE,
      anon_sym_true,
      anon_sym_false,
      aux_sym_decimal_token1,
      anon_sym_PLUS,
      anon_sym_DASH,
  [1095] = 2,
    ACTIONS(301), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(303), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1107] = 2,
    ACTIONS(279), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(281), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1119] = 2,
    ACTIONS(271), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(273), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1131] = 2,
    ACTIONS(263), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(265), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1143] = 2,
    ACTIONS(255), 1,
      aux_sym_document_token1,
    ACTIONS(257), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1155] = 2,
    ACTIONS(259), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(261), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1167] = 2,
    ACTIONS(301), 1,
      aux_sym_document_token1,
    ACTIONS(303), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1179] = 2,
    ACTIONS(295), 1,
      aux_sym_document_token1,
    ACTIONS(297), 6,
      anon_sym_RBRACE,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1191] = 2,
    ACTIONS(251), 2,
      ts_builtin_sym_end,
      aux_sym_document_token1,
    ACTIONS(253), 5,
      sym_node_comment_prefix,
      sym_bare_identifier,
      anon_sym_LPAREN,
      anon_sym_DQUOTE,
      anon_sym_SLASH_SLASH,
  [1203] = 5,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(305), 1,
      aux_sym_document_token1,
    ACTIONS(307), 1,
      anon_sym_SEMI,
    STATE(45), 1,
      sym_single_line_comment,
    STATE(53), 1,
      sym__node_terminator,
  [1219] = 5,
    ACTIONS(309), 1,
      sym_bare_identifier,
    ACTIONS(311), 1,
      anon_sym_DQUOTE,
    STATE(111), 1,
      sym__escaped_string,
    STATE(112), 1,
      sym_identifier,
    STATE(120), 1,
      sym_string,
  [1235] = 5,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(313), 1,
      aux_sym_document_token1,
    ACTIONS(315), 1,
      anon_sym_SEMI,
    STATE(47), 1,
      sym_single_line_comment,
    STATE(54), 1,
      sym__node_terminator,
  [1251] = 5,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(247), 1,
      sym_bare_identifier,
    STATE(3), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
  [1267] = 5,
    ACTIONS(309), 1,
      sym_bare_identifier,
    ACTIONS(311), 1,
      anon_sym_DQUOTE,
    STATE(111), 1,
      sym__escaped_string,
    STATE(114), 1,
      sym_identifier,
    STATE(120), 1,
      sym_string,
  [1283] = 5,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(317), 1,
      aux_sym_document_token1,
    ACTIONS(319), 1,
      anon_sym_SEMI,
    STATE(45), 1,
      sym_single_line_comment,
    STATE(63), 1,
      sym__node_terminator,
  [1299] = 5,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(247), 1,
      sym_bare_identifier,
    STATE(6), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
  [1315] = 5,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(321), 1,
      aux_sym_document_token1,
    ACTIONS(323), 1,
      anon_sym_SEMI,
    STATE(45), 1,
      sym_single_line_comment,
    STATE(51), 1,
      sym__node_terminator,
  [1331] = 5,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(247), 1,
      sym_bare_identifier,
    STATE(12), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
  [1347] = 5,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(325), 1,
      aux_sym_document_token1,
    ACTIONS(327), 1,
      anon_sym_SEMI,
    STATE(47), 1,
      sym_single_line_comment,
    STATE(60), 1,
      sym__node_terminator,
  [1363] = 5,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(329), 1,
      aux_sym_document_token1,
    ACTIONS(331), 1,
      anon_sym_SEMI,
    STATE(45), 1,
      sym_single_line_comment,
    STATE(61), 1,
      sym__node_terminator,
  [1379] = 5,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(333), 1,
      aux_sym_document_token1,
    ACTIONS(335), 1,
      anon_sym_SEMI,
    STATE(47), 1,
      sym_single_line_comment,
    STATE(69), 1,
      sym__node_terminator,
  [1395] = 5,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(337), 1,
      aux_sym_document_token1,
    ACTIONS(339), 1,
      anon_sym_SEMI,
    STATE(45), 1,
      sym_single_line_comment,
    STATE(48), 1,
      sym__node_terminator,
  [1411] = 4,
    ACTIONS(341), 1,
      aux_sym_decimal_token1,
    STATE(33), 1,
      sym_integer,
    STATE(117), 1,
      sym_sign,
    ACTIONS(116), 2,
      anon_sym_PLUS,
      anon_sym_DASH,
  [1425] = 5,
    ACTIONS(110), 1,
      anon_sym_DQUOTE,
    ACTIONS(247), 1,
      sym_bare_identifier,
    STATE(11), 1,
      sym_identifier,
    STATE(22), 1,
      sym_string,
    STATE(32), 1,
      sym__escaped_string,
  [1441] = 5,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(343), 1,
      aux_sym_document_token1,
    ACTIONS(345), 1,
      anon_sym_SEMI,
    STATE(47), 1,
      sym_single_line_comment,
    STATE(76), 1,
      sym__node_terminator,
  [1457] = 5,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(347), 1,
      aux_sym_document_token1,
    ACTIONS(349), 1,
      anon_sym_SEMI,
    STATE(47), 1,
      sym_single_line_comment,
    STATE(70), 1,
      sym__node_terminator,
  [1473] = 5,
    ACTIONS(15), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(351), 1,
      aux_sym_document_token1,
    ACTIONS(353), 1,
      anon_sym_SEMI,
    STATE(47), 1,
      sym_single_line_comment,
    STATE(71), 1,
      sym__node_terminator,
  [1489] = 5,
    ACTIONS(39), 1,
      anon_sym_SLASH_SLASH,
    ACTIONS(355), 1,
      aux_sym_document_token1,
    ACTIONS(357), 1,
      anon_sym_SEMI,
    STATE(45), 1,
      sym_single_line_comment,
    STATE(55), 1,
      sym__node_terminator,
  [1505] = 2,
    ACTIONS(359), 1,
      aux_sym_document_token1,
    ACTIONS(361), 2,
      anon_sym_SEMI,
      anon_sym_SLASH_SLASH,
  [1513] = 3,
    ACTIONS(363), 1,
      anon_sym_DQUOTE,
    ACTIONS(365), 1,
      sym__char,
    STATE(103), 1,
      aux_sym__escaped_string_repeat1,
  [1523] = 2,
    ACTIONS(367), 1,
      aux_sym_document_token1,
    ACTIONS(369), 2,
      anon_sym_SEMI,
      anon_sym_SLASH_SLASH,
  [1531] = 3,
    ACTIONS(365), 1,
      sym__char,
    ACTIONS(371), 1,
      anon_sym_DQUOTE,
    STATE(103), 1,
      aux_sym__escaped_string_repeat1,
  [1541] = 2,
    ACTIONS(373), 1,
      aux_sym_document_token1,
    ACTIONS(375), 2,
      anon_sym_SEMI,
      anon_sym_SLASH_SLASH,
  [1549] = 3,
    ACTIONS(377), 1,
      anon_sym_DQUOTE,
    ACTIONS(379), 1,
      sym__char,
    STATE(99), 1,
      aux_sym__escaped_string_repeat1,
  [1559] = 3,
    ACTIONS(381), 1,
      anon_sym_DQUOTE,
    ACTIONS(383), 1,
      sym__char,
    STATE(97), 1,
      aux_sym__escaped_string_repeat1,
  [1569] = 3,
    ACTIONS(385), 1,
      anon_sym_DQUOTE,
    ACTIONS(387), 1,
      sym__char,
    STATE(103), 1,
      aux_sym__escaped_string_repeat1,
  [1579] = 1,
    ACTIONS(299), 2,
      sym_bare_identifier,
      anon_sym_DQUOTE,
  [1584] = 1,
    ACTIONS(390), 1,
      aux_sym_single_line_comment_token1,
  [1588] = 1,
    ACTIONS(392), 1,
      aux_sym_decimal_token1,
  [1592] = 1,
    ACTIONS(394), 1,
      anon_sym_LBRACE,
  [1596] = 1,
    ACTIONS(396), 1,
      aux_sym_document_token1,
  [1600] = 1,
    ACTIONS(150), 1,
      anon_sym_RPAREN,
  [1604] = 1,
    ACTIONS(398), 1,
      aux_sym_single_line_comment_token1,
  [1608] = 1,
    ACTIONS(203), 1,
      anon_sym_RPAREN,
  [1612] = 1,
    ACTIONS(400), 1,
      anon_sym_RPAREN,
  [1616] = 1,
    ACTIONS(402), 1,
      anon_sym_EQ,
  [1620] = 1,
    ACTIONS(404), 1,
      anon_sym_RPAREN,
  [1624] = 1,
    ACTIONS(199), 1,
      anon_sym_RPAREN,
  [1628] = 1,
    ACTIONS(406), 1,
      aux_sym_document_token1,
  [1632] = 1,
    ACTIONS(408), 1,
      aux_sym_decimal_token1,
  [1636] = 1,
    ACTIONS(410), 1,
      aux_sym_decimal_token1,
  [1640] = 1,
    ACTIONS(412), 1,
      aux_sym_decimal_token1,
  [1644] = 1,
    ACTIONS(142), 1,
      anon_sym_RPAREN,
  [1648] = 1,
    ACTIONS(414), 1,
      ts_builtin_sym_end,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(15)] = 0,
  [SMALL_STATE(16)] = 47,
  [SMALL_STATE(17)] = 76,
  [SMALL_STATE(18)] = 102,
  [SMALL_STATE(19)] = 124,
  [SMALL_STATE(20)] = 146,
  [SMALL_STATE(21)] = 168,
  [SMALL_STATE(22)] = 206,
  [SMALL_STATE(23)] = 226,
  [SMALL_STATE(24)] = 268,
  [SMALL_STATE(25)] = 288,
  [SMALL_STATE(26)] = 330,
  [SMALL_STATE(27)] = 372,
  [SMALL_STATE(28)] = 414,
  [SMALL_STATE(29)] = 456,
  [SMALL_STATE(30)] = 498,
  [SMALL_STATE(31)] = 540,
  [SMALL_STATE(32)] = 560,
  [SMALL_STATE(33)] = 580,
  [SMALL_STATE(34)] = 599,
  [SMALL_STATE(35)] = 618,
  [SMALL_STATE(36)] = 637,
  [SMALL_STATE(37)] = 656,
  [SMALL_STATE(38)] = 675,
  [SMALL_STATE(39)] = 694,
  [SMALL_STATE(40)] = 713,
  [SMALL_STATE(41)] = 732,
  [SMALL_STATE(42)] = 751,
  [SMALL_STATE(43)] = 770,
  [SMALL_STATE(44)] = 789,
  [SMALL_STATE(45)] = 801,
  [SMALL_STATE(46)] = 813,
  [SMALL_STATE(47)] = 835,
  [SMALL_STATE(48)] = 847,
  [SMALL_STATE(49)] = 859,
  [SMALL_STATE(50)] = 871,
  [SMALL_STATE(51)] = 883,
  [SMALL_STATE(52)] = 895,
  [SMALL_STATE(53)] = 907,
  [SMALL_STATE(54)] = 919,
  [SMALL_STATE(55)] = 931,
  [SMALL_STATE(56)] = 943,
  [SMALL_STATE(57)] = 955,
  [SMALL_STATE(58)] = 967,
  [SMALL_STATE(59)] = 979,
  [SMALL_STATE(60)] = 1001,
  [SMALL_STATE(61)] = 1013,
  [SMALL_STATE(62)] = 1025,
  [SMALL_STATE(63)] = 1037,
  [SMALL_STATE(64)] = 1049,
  [SMALL_STATE(65)] = 1061,
  [SMALL_STATE(66)] = 1073,
  [SMALL_STATE(67)] = 1085,
  [SMALL_STATE(68)] = 1095,
  [SMALL_STATE(69)] = 1107,
  [SMALL_STATE(70)] = 1119,
  [SMALL_STATE(71)] = 1131,
  [SMALL_STATE(72)] = 1143,
  [SMALL_STATE(73)] = 1155,
  [SMALL_STATE(74)] = 1167,
  [SMALL_STATE(75)] = 1179,
  [SMALL_STATE(76)] = 1191,
  [SMALL_STATE(77)] = 1203,
  [SMALL_STATE(78)] = 1219,
  [SMALL_STATE(79)] = 1235,
  [SMALL_STATE(80)] = 1251,
  [SMALL_STATE(81)] = 1267,
  [SMALL_STATE(82)] = 1283,
  [SMALL_STATE(83)] = 1299,
  [SMALL_STATE(84)] = 1315,
  [SMALL_STATE(85)] = 1331,
  [SMALL_STATE(86)] = 1347,
  [SMALL_STATE(87)] = 1363,
  [SMALL_STATE(88)] = 1379,
  [SMALL_STATE(89)] = 1395,
  [SMALL_STATE(90)] = 1411,
  [SMALL_STATE(91)] = 1425,
  [SMALL_STATE(92)] = 1441,
  [SMALL_STATE(93)] = 1457,
  [SMALL_STATE(94)] = 1473,
  [SMALL_STATE(95)] = 1489,
  [SMALL_STATE(96)] = 1505,
  [SMALL_STATE(97)] = 1513,
  [SMALL_STATE(98)] = 1523,
  [SMALL_STATE(99)] = 1531,
  [SMALL_STATE(100)] = 1541,
  [SMALL_STATE(101)] = 1549,
  [SMALL_STATE(102)] = 1559,
  [SMALL_STATE(103)] = 1569,
  [SMALL_STATE(104)] = 1579,
  [SMALL_STATE(105)] = 1584,
  [SMALL_STATE(106)] = 1588,
  [SMALL_STATE(107)] = 1592,
  [SMALL_STATE(108)] = 1596,
  [SMALL_STATE(109)] = 1600,
  [SMALL_STATE(110)] = 1604,
  [SMALL_STATE(111)] = 1608,
  [SMALL_STATE(112)] = 1612,
  [SMALL_STATE(113)] = 1616,
  [SMALL_STATE(114)] = 1620,
  [SMALL_STATE(115)] = 1624,
  [SMALL_STATE(116)] = 1628,
  [SMALL_STATE(117)] = 1632,
  [SMALL_STATE(118)] = 1636,
  [SMALL_STATE(119)] = 1640,
  [SMALL_STATE(120)] = 1644,
  [SMALL_STATE(121)] = 1648,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_document, 0),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(23),
  [7] = {.entry = {.count = 1, .reusable = false}}, SHIFT(59),
  [9] = {.entry = {.count = 1, .reusable = false}}, SHIFT(22),
  [11] = {.entry = {.count = 1, .reusable = false}}, SHIFT(78),
  [13] = {.entry = {.count = 1, .reusable = false}}, SHIFT(102),
  [15] = {.entry = {.count = 1, .reusable = false}}, SHIFT(105),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(58),
  [19] = {.entry = {.count = 1, .reusable = false}}, SHIFT(27),
  [21] = {.entry = {.count = 1, .reusable = false}}, SHIFT(107),
  [23] = {.entry = {.count = 1, .reusable = false}}, SHIFT(58),
  [25] = {.entry = {.count = 1, .reusable = false}}, SHIFT(40),
  [27] = {.entry = {.count = 1, .reusable = false}}, SHIFT(81),
  [29] = {.entry = {.count = 1, .reusable = false}}, SHIFT(38),
  [31] = {.entry = {.count = 1, .reusable = false}}, SHIFT(18),
  [33] = {.entry = {.count = 1, .reusable = false}}, SHIFT(119),
  [35] = {.entry = {.count = 1, .reusable = true}}, SHIFT(72),
  [37] = {.entry = {.count = 1, .reusable = false}}, SHIFT(72),
  [39] = {.entry = {.count = 1, .reusable = false}}, SHIFT(110),
  [41] = {.entry = {.count = 1, .reusable = true}}, SHIFT(74),
  [43] = {.entry = {.count = 1, .reusable = false}}, SHIFT(74),
  [45] = {.entry = {.count = 1, .reusable = true}}, SHIFT(50),
  [47] = {.entry = {.count = 1, .reusable = false}}, SHIFT(50),
  [49] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
  [51] = {.entry = {.count = 1, .reusable = false}}, SHIFT(56),
  [53] = {.entry = {.count = 1, .reusable = true}}, SHIFT(57),
  [55] = {.entry = {.count = 1, .reusable = false}}, SHIFT(57),
  [57] = {.entry = {.count = 1, .reusable = true}}, SHIFT(44),
  [59] = {.entry = {.count = 1, .reusable = false}}, SHIFT(44),
  [61] = {.entry = {.count = 1, .reusable = true}}, SHIFT(68),
  [63] = {.entry = {.count = 1, .reusable = false}}, SHIFT(68),
  [65] = {.entry = {.count = 1, .reusable = true}}, SHIFT(73),
  [67] = {.entry = {.count = 1, .reusable = false}}, SHIFT(73),
  [69] = {.entry = {.count = 1, .reusable = true}}, SHIFT(64),
  [71] = {.entry = {.count = 1, .reusable = false}}, SHIFT(64),
  [73] = {.entry = {.count = 1, .reusable = true}}, SHIFT(49),
  [75] = {.entry = {.count = 1, .reusable = false}}, SHIFT(49),
  [77] = {.entry = {.count = 1, .reusable = true}}, SHIFT(62),
  [79] = {.entry = {.count = 1, .reusable = false}}, SHIFT(62),
  [81] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_node_repeat1, 2),
  [83] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2),
  [85] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(22),
  [88] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(40),
  [91] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(81),
  [94] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(102),
  [97] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(38),
  [100] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(18),
  [103] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_node_repeat1, 2), SHIFT_REPEAT(119),
  [106] = {.entry = {.count = 1, .reusable = true}}, SHIFT(40),
  [108] = {.entry = {.count = 1, .reusable = true}}, SHIFT(81),
  [110] = {.entry = {.count = 1, .reusable = true}}, SHIFT(102),
  [112] = {.entry = {.count = 1, .reusable = true}}, SHIFT(38),
  [114] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [116] = {.entry = {.count = 1, .reusable = true}}, SHIFT(119),
  [118] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_decimal, 1),
  [120] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_decimal, 1),
  [122] = {.entry = {.count = 1, .reusable = false}}, SHIFT(106),
  [124] = {.entry = {.count = 1, .reusable = false}}, SHIFT(90),
  [126] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_decimal, 3),
  [128] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_decimal, 3),
  [130] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_integer, 1),
  [132] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_integer, 1),
  [134] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_integer, 2),
  [136] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_integer, 2),
  [138] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_value, 1),
  [140] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_value, 1),
  [142] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_identifier, 1),
  [144] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_identifier, 1),
  [146] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_document, 1),
  [148] = {.entry = {.count = 1, .reusable = true}}, SHIFT(29),
  [150] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__escaped_string, 2),
  [152] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym__escaped_string, 2),
  [154] = {.entry = {.count = 1, .reusable = true}}, SHIFT(30),
  [156] = {.entry = {.count = 1, .reusable = false}}, SHIFT(98),
  [158] = {.entry = {.count = 1, .reusable = false}}, SHIFT(46),
  [160] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(26),
  [163] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2),
  [165] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(46),
  [168] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(22),
  [171] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(78),
  [174] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(102),
  [177] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(110),
  [180] = {.entry = {.count = 1, .reusable = true}}, SHIFT(28),
  [182] = {.entry = {.count = 1, .reusable = false}}, SHIFT(96),
  [184] = {.entry = {.count = 1, .reusable = true}}, SHIFT(26),
  [186] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_document_repeat1, 2),
  [188] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(29),
  [191] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(59),
  [194] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_document_repeat1, 2), SHIFT_REPEAT(105),
  [197] = {.entry = {.count = 1, .reusable = false}}, SHIFT(100),
  [199] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__escaped_string, 3),
  [201] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym__escaped_string, 3),
  [203] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_string, 1),
  [205] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_string, 1),
  [207] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_exponent, 2),
  [209] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_exponent, 2),
  [211] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_value, 2),
  [213] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_value, 2),
  [215] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_decimal, 4),
  [217] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_decimal, 4),
  [219] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_number, 1),
  [221] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_number, 1),
  [223] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_boolean, 1),
  [225] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_boolean, 1),
  [227] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_prop, 3),
  [229] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_prop, 3),
  [231] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_keyword, 1),
  [233] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_keyword, 1),
  [235] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_decimal, 2),
  [237] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_decimal, 2),
  [239] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 3, .production_id = 5),
  [241] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 3, .production_id = 5),
  [243] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__node_terminator, 1, .production_id = 2),
  [245] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym__node_terminator, 1, .production_id = 2),
  [247] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [249] = {.entry = {.count = 1, .reusable = true}}, SHIFT(78),
  [251] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 6, .production_id = 13),
  [253] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 6, .production_id = 13),
  [255] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 3, .production_id = 3),
  [257] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 3, .production_id = 3),
  [259] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 5, .production_id = 12),
  [261] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 5, .production_id = 12),
  [263] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 5, .production_id = 11),
  [265] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 5, .production_id = 11),
  [267] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_single_line_comment, 3),
  [269] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_single_line_comment, 3),
  [271] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 5, .production_id = 10),
  [273] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 5, .production_id = 10),
  [275] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 3, .production_id = 4),
  [277] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 3, .production_id = 4),
  [279] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 4, .production_id = 9),
  [281] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 4, .production_id = 9),
  [283] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 4, .production_id = 8),
  [285] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 4, .production_id = 8),
  [287] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 4, .production_id = 7),
  [289] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 4, .production_id = 7),
  [291] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 4, .production_id = 6),
  [293] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 4, .production_id = 6),
  [295] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 1),
  [297] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_comment, 1),
  [299] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_type, 3),
  [301] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node, 2, .production_id = 1),
  [303] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node, 2, .production_id = 1),
  [305] = {.entry = {.count = 1, .reusable = true}}, SHIFT(53),
  [307] = {.entry = {.count = 1, .reusable = false}}, SHIFT(53),
  [309] = {.entry = {.count = 1, .reusable = true}}, SHIFT(120),
  [311] = {.entry = {.count = 1, .reusable = true}}, SHIFT(101),
  [313] = {.entry = {.count = 1, .reusable = true}}, SHIFT(54),
  [315] = {.entry = {.count = 1, .reusable = false}}, SHIFT(54),
  [317] = {.entry = {.count = 1, .reusable = true}}, SHIFT(63),
  [319] = {.entry = {.count = 1, .reusable = false}}, SHIFT(63),
  [321] = {.entry = {.count = 1, .reusable = true}}, SHIFT(51),
  [323] = {.entry = {.count = 1, .reusable = false}}, SHIFT(51),
  [325] = {.entry = {.count = 1, .reusable = true}}, SHIFT(60),
  [327] = {.entry = {.count = 1, .reusable = false}}, SHIFT(60),
  [329] = {.entry = {.count = 1, .reusable = true}}, SHIFT(61),
  [331] = {.entry = {.count = 1, .reusable = false}}, SHIFT(61),
  [333] = {.entry = {.count = 1, .reusable = true}}, SHIFT(69),
  [335] = {.entry = {.count = 1, .reusable = false}}, SHIFT(69),
  [337] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [339] = {.entry = {.count = 1, .reusable = false}}, SHIFT(48),
  [341] = {.entry = {.count = 1, .reusable = true}}, SHIFT(41),
  [343] = {.entry = {.count = 1, .reusable = true}}, SHIFT(76),
  [345] = {.entry = {.count = 1, .reusable = false}}, SHIFT(76),
  [347] = {.entry = {.count = 1, .reusable = true}}, SHIFT(70),
  [349] = {.entry = {.count = 1, .reusable = false}}, SHIFT(70),
  [351] = {.entry = {.count = 1, .reusable = true}}, SHIFT(71),
  [353] = {.entry = {.count = 1, .reusable = false}}, SHIFT(71),
  [355] = {.entry = {.count = 1, .reusable = true}}, SHIFT(55),
  [357] = {.entry = {.count = 1, .reusable = false}}, SHIFT(55),
  [359] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node_block, 2),
  [361] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node_block, 2),
  [363] = {.entry = {.count = 1, .reusable = false}}, SHIFT(31),
  [365] = {.entry = {.count = 1, .reusable = true}}, SHIFT(103),
  [367] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node_block, 3),
  [369] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node_block, 3),
  [371] = {.entry = {.count = 1, .reusable = false}}, SHIFT(115),
  [373] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_node_block, 4),
  [375] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_node_block, 4),
  [377] = {.entry = {.count = 1, .reusable = false}}, SHIFT(109),
  [379] = {.entry = {.count = 1, .reusable = true}}, SHIFT(99),
  [381] = {.entry = {.count = 1, .reusable = false}}, SHIFT(24),
  [383] = {.entry = {.count = 1, .reusable = true}}, SHIFT(97),
  [385] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym__escaped_string_repeat1, 2),
  [387] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__escaped_string_repeat1, 2), SHIFT_REPEAT(103),
  [390] = {.entry = {.count = 1, .reusable = true}}, SHIFT(108),
  [392] = {.entry = {.count = 1, .reusable = true}}, SHIFT(17),
  [394] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [396] = {.entry = {.count = 1, .reusable = true}}, SHIFT(52),
  [398] = {.entry = {.count = 1, .reusable = true}}, SHIFT(116),
  [400] = {.entry = {.count = 1, .reusable = true}}, SHIFT(104),
  [402] = {.entry = {.count = 1, .reusable = true}}, SHIFT(15),
  [404] = {.entry = {.count = 1, .reusable = true}}, SHIFT(67),
  [406] = {.entry = {.count = 1, .reusable = true}}, SHIFT(66),
  [408] = {.entry = {.count = 1, .reusable = true}}, SHIFT(42),
  [410] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [412] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_sign, 1),
  [414] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
};

#ifdef __cplusplus
extern "C" {
#endif
#ifdef _WIN32
#define extern __declspec(dllexport)
#endif

extern const TSLanguage *tree_sitter_kdl(void) {
  static const TSLanguage language = {
    .version = LANGUAGE_VERSION,
    .symbol_count = SYMBOL_COUNT,
    .alias_count = ALIAS_COUNT,
    .token_count = TOKEN_COUNT,
    .external_token_count = EXTERNAL_TOKEN_COUNT,
    .state_count = STATE_COUNT,
    .large_state_count = LARGE_STATE_COUNT,
    .production_id_count = PRODUCTION_ID_COUNT,
    .field_count = FIELD_COUNT,
    .max_alias_sequence_length = MAX_ALIAS_SEQUENCE_LENGTH,
    .parse_table = &ts_parse_table[0][0],
    .small_parse_table = ts_small_parse_table,
    .small_parse_table_map = ts_small_parse_table_map,
    .parse_actions = ts_parse_actions,
    .symbol_names = ts_symbol_names,
    .field_names = ts_field_names,
    .field_map_slices = ts_field_map_slices,
    .field_map_entries = ts_field_map_entries,
    .symbol_metadata = ts_symbol_metadata,
    .public_symbol_map = ts_symbol_map,
    .alias_map = ts_non_terminal_alias_map,
    .alias_sequences = &ts_alias_sequences[0][0],
    .lex_modes = ts_lex_modes,
    .lex_fn = ts_lex,
  };
  return &language;
}
#ifdef __cplusplus
}
#endif
