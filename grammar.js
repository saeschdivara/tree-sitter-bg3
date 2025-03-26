/**
 * @file Bg3 grammar for tree-sitter
 * @author byteblender <byteblender21@gmail.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "bg_3",

  rules: {
    // TODO: add the actual grammar rules
    source_file: $ => "hello",

    string_fragment: _ => token.immediate(prec(1, /[^"\\]+/)),

    string_literal: $ => seq(
        '"',
        repeat($.string_fragment),
        '"',
    ),
  }
});
