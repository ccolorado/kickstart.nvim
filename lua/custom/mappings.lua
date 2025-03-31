return {
  -- save as sudo
  -- vim.api.nvim_set_keymap('c', 'w!!', 'w S !sudo tee > /dev/null %', { noremap  true, silent = true }),
  vim.api.nvim_set_keymap('c', 'w!!', ':SudaWrite', { noremap = true, silent = true }),

  vim.keymap.set('v', '//', 'y/<C-R>"<CR>', { desc = 'Search highlighted text' }),
  vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit instart mode with jj' }),
  vim.keymap.set('i', 'ii', '<ESC>', { desc = 'Exit insert mode with ii' }),

  -- Terminals
  -- :ToggleTerm direction=float
  vim.keymap.set('n', '<Leader>tt', ':ToggleTerm direction=float<CR>', { desc = 'Open floating termianl' }),
  vim.keymap.set('n', '<Leader>ttv', ':ToggleTerm direction=vertical<CR>', { desc = 'Open vertical termianl' }),
  vim.keymap.set('n', '<Leader>tth', ':ToggleTerm direction=horizontal<CR>', { desc = 'Open horizontal termianl' }),
  vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open parent directory' }),

  -- Git
  -- TODO: search helpers for
  --  * change branch, * pull , * push

  -- -- gitsigns
  --
  -- -- fugitive
  vim.keymap.set('n', '<Leader>gd', ':Gvdiffsplit<CR>', { desc = 'Git diff file on in vertical split ' }),
  vim.keymap.set('n', '<Leader>gb', ':G blame<CR>', { desc = 'Show Git blame pane (toggle not workign)' }),

  -- using neogit's instead
  vim.keymap.set('n', '<Leader>gs', ':Neogit kind=auto<CR>', { silent = true, noremap = true, desc = 'Opens Neogit' }),

  vim.keymap.set('n', '<Leader>gm', ':GMove ', { desc = 'Git move files by prompts destinantion path' }),
  vim.keymap.set('n', '<Leader>gc', ':G commit<CR>', { desc = 'Git commit' }), -- commits staged only

  -- `:Git mergetool`
  -- `:Git difftool`
  -- vim.keymap.set('n', '<leader>D', ':DiffSaved <CR>', { desc = 'Show unsaved diff' }),
  --  hunks @ init lua
  -- vim.keymap.set('n', '<Leader>gtm', ':G difftool<CR>'),
  -- vim.keymap.set('n', '<Leader>gtd', ':G mergetool<CR>'),

  -- vim.keymap.set('n', '<Leader>f', '<cmd>NvimTreeToggle<CR>'),
  vim.keymap.set('n', '<Leader>f', '<cmd>Neotree toggle <CR>', { desc = 'Toggles Neotree window' }),

  -- vim.keymap.set('n', '<Leader>*', ':Telescope grep_string<CR>', { desc = 'Ripgrep Word under cursor with telescope' }),
  -- Tabs shortcuts
  -- vim.keymap.set('n', '<Leader>h', '<cmd>tabprevious<CR>', { desc = 'Tab Previou <-' }),
  -- vim.keymap.set('n', '<Leader>k', '<cmd>tabnew<CR>', { desc = 'Tab New ^' }),
  -- vim.keymap.set('n', '<Leader>l', '<cmd>tabnext<CR>', { desc = 'Tab Next ->' }),

  -- Window Control
  vim.keymap.set('n', '<leader>gf', '<cmd>:vert wincmd f<CR>', { desc = 'Open filepath under cursor on vertical split' }),
  vim.keymap.set('n', '<Leader>o', '<cmd>WindowsMaximize<CR>', { desc = 'Maximize current pane' }),
  vim.keymap.set('n', '<leader>ss', ':call WindowSwap#EasyWindowSwap()<CR>', { silent = true, desc = 'Swap or Mark window for swapping' }),
  -- Window Resizing
  vim.keymap.set('n', '<C-Right>', '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window width' }),
  vim.keymap.set('n', '<C-Left>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window width' }),
  vim.keymap.set('n', '<C-Up>', '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window height' }),
  vim.keymap.set('n', '<C-Down>', '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window height' }),

  vim.keymap.set('n', '<Leader>o', '<cmd>WindowsMaximize<CR>', { desc = 'Maximize current pane' }),

  -- -- 'Find in nvmim config')
  -- local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>nv', function()
    require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
  end, { desc = 'Jump to neovim config' }),

  -- vim.keymap.set('n', '<leadre>fm', require('telescope.builtin').find_marks, { desc = 'Find Marks' }),

  vim.keymap.set('n', '<leader>al', function()
    vim.cmd 'normal! vap' -- Select around the paragraph
    vim.cmd "'<,'>EasyAlign*|" -- Run the EasyAlign command
  end, { desc = 'Align around paragraph with *|' }),

  -- Avante AI keymaps
  vim.keymap.set('n', '<leader>aa', '<cmd>AvanteAsk<cr>', { desc = 'Ask Avante AI' }),
  vim.keymap.set('n', '<leader>ae', '<cmd>AvanteEdit<cr>', { desc = 'Edit with Avante AI' }),
  vim.keymap.set('n', '<leader>ar', '<cmd>AvanteRefresh<cr>', { desc = 'Refresh Avante AI' }),
  vim.keymap.set('n', '<leader>af', '<cmd>AvanteFocus<cr>', { desc = 'Focus Avante AI' }),
  vim.keymap.set('n', '<leader>at', '<cmd>AvanteToggle<cr>', { desc = 'Toggle Avante AI' }),
  vim.keymap.set('n', '<leader>ad', '<cmd>AvanteToggleDebug<cr>', { desc = 'Toggle Avante Debug' }),
  vim.keymap.set('n', '<leader>ah', '<cmd>AvanteToggleHint<cr>', { desc = 'Toggle Avante Hint' }),
  vim.keymap.set('n', '<leader>as', '<cmd>AvanteToggleSuggestion<cr>', { desc = 'Toggle Avante Suggestion' }),
  vim.keymap.set('n', '<leader>aR', '<cmd>AvanteToggleRepomap<cr>', { desc = 'Toggle Avante Repomap' }),

  -- Harpoon mappings
  -- local M = {}
  --
  -- M.setup_harpoon = function()
  --   local harpoon = require('harpoon')
  --
  --   vim.keymap.set('n', '<leader>za', function() harpoon:list():add() end, { desc = 'Harpoon: add file' })
  --   vim.keymap.set('n', '<leader>zs', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: show files' })
  --
  --   vim.keymap.set('n', '<leader>6', function() harpoon:list():select(1) end, { desc = 'Harpoon: pick element 1' })
  --   vim.keymap.set('n', '<leader>7', function() harpoon:list():select(2) end, { desc = 'Harpoon: pick element 2' })
  --   vim.keymap.set('n', '<leader>8', function() harpoon:list():select(3) end, { desc = 'Harpoon: pick element 3' })
  --   vim.keymap.set('n', '<leader>9', function() harpoon:list():select(4) end, { desc = 'Harpoon: pick element 4' })
  --   vim.keymap.set('n', '<leader>0', function() harpoon:list():select(5) end, { desc = 'Harpoon: pick element 5' })
  --   -- Toggle previous & next buffers stored within Harpoon list
  --   -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  --   -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  -- end
  --
  -- return M
}
