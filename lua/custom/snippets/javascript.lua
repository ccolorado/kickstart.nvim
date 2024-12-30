local ls = require 'luasnip'

ls.add_snippets('javascript', {

  ls.add_snippets('javascript', {

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
