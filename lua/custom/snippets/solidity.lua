local ls = require 'luasnip'

ls.add_snippets('solidity', {

  -- NOTE: way better snippets (func, funcr, funcrview)
  -- ls.parser.parse_snippet('fn', 'function ${1:name}(${2:args})\n  ${3}\nend'),
  --
  -- funcrview  | returns View Function declaration
  -- funcr      | returns function declaration
  -- func       | function declaration

  -- NOTE: NAT DOC
  -- ///nat_statevariable | statevariable getter
  -- ///nat_function      | function nat
  -- ///nat_event         | event nat
  -- ///nat_contract      | contract nat

  ls.parser.parse_snippet('@p', '/// @param ${1:name} ${2:description}\n$3'),

  ls.parser.parse_snippet('txcall', '(bool sent, ${3:bytes data}) = ${1:recipient}.call{value: ${2:amount}}("");'),

  ls.parser.parse_snippet('fori', 'for (uint256 ${2:i} = 0; $1 < ${1:array}Length; ${3:++}$2) {\n\t$0\n}'),

  ls.add_snippets('solidity', {

    ls.snippet({ trig = 'lv', dscr = 'Prints variable name and value in console.log' }, {
      ls.text_node { 'console.log(' },
      ls.function_node(function(_, snip)
        return tostring(snip.env.TM_LINE_NUMBER)
      end, {}),
      ls.text_node { ', "' },
      ls.dynamic_node(2, function(args)
        return ls.snippet_node(nil, {
          ls.text_node(args[1][1] or 'var_name'),
        })
      end, { 1 }),
      ls.text_node { '", ' },
      ls.insert_node(1, ''),
      ls.text_node { ');' },
    }),

    ls.snippet({ trig = 'll', dscr = 'Prints relative file path and line number in console.log' }, {
      -- Start with the console.log statement
      ls.text_node 'console.log(" ->>> ',
      -- Function node to get the relative file path
      ls.function_node(function()
        local file_path = vim.api.nvim_buf_get_name(0)
        local cwd = vim.loop.cwd() -- Get the directory where Neovim was opened
        local relative_path = vim.fn.fnamemodify(file_path, ':~:.') -- Relative to CWD
        return relative_path
      end, {}),
      ls.text_node ':',
      -- Function node to get the current line number
      ls.function_node(function()
        return tostring(vim.fn.line '.')
      end, {}),
      ls.text_node '");',
      -- Add a newline and move the cursor to the next line with proper indentation
      ls.text_node { '', '' },
      ls.insert_node(0), -- Cursor goes here
    }),
  }),
})
