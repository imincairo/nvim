-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
--vim.opt.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
-- Set colorscheme
vim.o.termguicolors = true
	--enable transparency
vim.cmd([[
	augroup user_colors
		autocmd!
		autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
	augroup END
]])
vim.cmd('colorscheme solarized')
--vim.opt.background = 'dark'
vim.g.solarized_italics = 1
vim.g.solarized_visibility = 'normal'
vim.g.solarized_diffmode = 'normal'
vim.g.solarized_statusline = 'normal'
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'
-- Tab Options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- Fold stuff
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr="nvim_treesitter#foldexpr()"
-- Screen Stuff
vim.opt.scrolloff = 3
vim.wo.number = true
vim.opt.numberwidth = 3
vim.opt.cursorline = true

