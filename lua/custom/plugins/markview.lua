return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false, -- Recommended
    priority = 49,
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('markview').setup {}

      -- Re-render markview on window resize to fix stale virtual-text "rivers".
      -- Markview's inline-code padding/alignment uses virtual text that does not
      -- automatically refresh when window width changes, leaving blank gaps until
      -- the buffer is re-rendered.
      vim.api.nvim_create_autocmd({ 'VimResized', 'WinResized' }, {
        group = vim.api.nvim_create_augroup('MarkviewResizeRedraw', { clear = true }),
        callback = function()
          pcall(vim.cmd, 'Markview render')
        end,
      })
    end,
  },
}
