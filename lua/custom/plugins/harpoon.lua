return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      -- Mappings
      vim.keymap.set('n', '<leader>za', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: add file' })

      vim.keymap.set('n', '<leader>zs', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: show files' })

      vim.keymap.set('n', '<leader>6', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: pick element 1' })

      vim.keymap.set('n', '<leader>7', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: pick element 2' })

      vim.keymap.set('n', '<leader>8', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: pick element 3' })

      vim.keymap.set('n', '<leader>9', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: pick element 4' })

      vim.keymap.set('n', '<leader>0', function()
        harpoon:list():select(5)
      end, { desc = 'Harpoon: pick element 5' })

      -- Toggle previous & next buffers stored within Harpoon list
      -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
  },
}
