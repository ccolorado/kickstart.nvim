-- Testing
-- vim.opt.wildmode = 'longest,list,full'

-- Taken from:
-- https://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
--
-- Bash like:
-- vim.opt.wildmode = 'longest,list:longest,full'
vim.opt.wildmode = 'longest,list'

vim.o.termguicolors = true

-- Force transapert background
-- WIP: fixing inconsisteng transparent background
vim.api.nvim_set_hl(0, 'Normal', { guibg = 'NONE', ctermbg = 'NONE' })

-- Set haskell ft for daml files
-- TODO: Create a filetype lua file and move it there
vim.filetype.add {
  extension = {
    daml = 'haskell',
  },
}
