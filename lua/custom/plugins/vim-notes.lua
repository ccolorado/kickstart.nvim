return {
  {
    'xolox/vim-notes',
    dependencies = { 'xolox/vim-misc' },
    config = function()
      local ok, local_cfg = pcall(require, 'custom.local')
      vim.g.notes_directories = { ok and local_cfg.notes_dir or '~/Notes/src' }
      vim.g.notes_conceal_code = 0
      vim.g.notes_smart_quotes = 0
    end,
  },
}
