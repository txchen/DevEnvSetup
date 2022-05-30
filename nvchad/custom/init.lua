local vim = vim
local opt = vim.opt

--
-- General settings
--
opt.swapfile = false
-- Enable per-directory .vimrc files and disable unsafe commands in them
opt.exrc  = true
opt.secure = true
-- toggle paste mode in insert mode
opt.pastetoggle="<F2>"

--
-- Visual settings
--
opt.colorcolumn = "120"
opt.scrolloff = 10

-- show 'invisible' characters
opt.listchars = "trail:·,tab:»·,nbsp:_"
opt.list = true