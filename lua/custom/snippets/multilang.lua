local ls = require 'luasnip'

ls.add_snippets({ 'typescript', 'javascript' }, {
  -- Console log variable
  ls.snippet('lv', {
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

  ls.snippet('ll', {
    ls.text_node 'console.log(">>',
    -- Function node to get the full file path
    ls.function_node(function(_, snip)
      -- Get the full file path
      local file_path = vim.api.nvim_buf_get_name(0)
      return file_path
    end, {}),
    ls.text_node ': ',
    -- Function node to get the current line number
    ls.function_node(function(_, snip)
      -- Get the current line number
      return tostring(vim.fn.line '.')
    end, {}),
    ls.text_node '");',
  }),
})
