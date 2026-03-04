return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        default_integrations = true,
        float = {
          transparent = true,
          solid = false,
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        custom_highlights = function(colors)
          return {
            CursorLine = { bg = colors.surface2 },
            CursorLineNr = { fg = colors.lavender, style = { 'bold' } },
          }
        end,
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
