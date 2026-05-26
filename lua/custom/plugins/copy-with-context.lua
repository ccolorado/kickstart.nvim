return {
  {
    'zhisme/copy_with_context.nvim',
    config = function()
      require('copy_with_context').setup {
        mappings = {
          relative = '<leader>cy',
          absolute = '<leader>cY',
          remote = '<leader>cr',
        },
        output_formats = {
          default = '{filepath}:{line}\n{copied_text}',
          remote = '{remote_url}:{line}\n{copied_text}',
        },
      }
    end,
  },
}
