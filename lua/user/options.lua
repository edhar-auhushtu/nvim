local o = vim.opt

o.shiftwidth = 2
o.tabstop = 2
o.scrolloff = 8
o.sidescrolloff = 8
--[[ o.cmdheight = 4 ]]
o.updatetime = 300
o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.ignorecase = true
o.smartcase = true
o.smartindent = true
o.expandtab = true
o.hlsearch = false
o.showmode = false
o.backup = false
o.undofile = true
o.termguicolors = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.fileencoding = "utf-8"
o.completeopt = { "menuone", "noselect" }
o.shortmess:append("c")
o.iskeyword:append("-")
