local ls = require("luasnip")

ls.snippets = {
  javascript = {
    ls.parser.parse_snippet("cl", "console.log($1)"),
    ls.parser.parse_snippet("db", "console.log($1, '\x1b[33m', '$TM_FILENAME:$TM_LINE_NUMBER', '\x1b[0m')"),
    ls.parser.parse_snippet("ca", "const $1 = ($2) => $3"),
    ls.parser.parse_snippet("cf", "const $1 = function($2) {\n  $3\n}"),
    ls.parser.parse_snippet("caf", "const $1 = async function($2) {\n  $3\n}"),
    ls.parser.parse_snippet("f", "function $1($2) {\n  $3\n}"),
    ls.parser.parse_snippet("af", "async function $1($2) {\n  $3\n}"),
    ls.parser.parse_snippet("caa", "const $1 = async ($2) => $3"),
    ls.parser.parse_snippet("co", "const $1 = {\n  $2\n}"),
    ls.parser.parse_snippet("a", "($1) => $2"),
    ls.parser.parse_snippet("s", "{\n  $1\n}"),
    ls.parser.parse_snippet("fof", "for (const $1 of $2) $3"),
    ls.parser.parse_snippet("fin", "for (const $1 in $2) $3"),
    ls.parser.parse_snippet("if", "if ($1) $2"),
    ls.parser.parse_snippet("eif", "else if ($1) $2"),
    ls.parser.parse_snippet("try", "try {\n  $1\n} catch(${2:err}) {\n  $3\n}"),
    ls.parser.parse_snippet("r", "return $1"),


    -- cds specific
    ls.parser.parse_snippet("srv", "module.exports = srv => {\n  $1\n}"),
    ls.parser.parse_snippet("rbo", "srv.on('READ', 'Books', async (req, next) => {\n  $1\n}"),
    ls.parser.parse_snippet("cbo", "srv.on('CREATE', 'Books', async (req, next) => {\n  $1\n}"),

    -- jest
    ls.parser.parse_snippet("exe", "expect($1).toEqual($2)"),
  }
}

