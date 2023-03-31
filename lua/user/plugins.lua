local fn = vim.fn

-- Automatically install Packer plugin manager
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer, close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads Neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
	vim.notify("require packer call failed, make sure that it is installed")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

	use("lunarvim/onedarker.nvim") -- Colorscheme

	use("hrsh7th/nvim-cmp") -- Completion plugin
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/cmp-cmdline") -- Cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua") -- Nvim Lua completions
	use("saadparwaiz1/cmp_luasnip") -- Snippet completions

	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("rafamadriz/friendly-snippets") -- A bunch of snippets to use

	use("neovim/nvim-lspconfig") -- LSP
	use("williamboman/mason.nvim") -- Mason - language server installer
	use("williamboman/mason-lspconfig.nvim") -- Mason and lspconfig integration
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("mfussenegger/nvim-jdtls") -- Java language server

	use("nvim-telescope/telescope.nvim") -- Telescope - fuzzy finder

	use({
		"nvim-treesitter/nvim-treesitter", -- Tree-sitter - parsing library
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow") -- Rainbow brackets

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Comment staff out
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Context dependent commenting
	use("lewis6991/gitsigns.nvim") -- Git integration
	use("nvim-tree/nvim-web-devicons") -- File type icons
	use("nvim-tree/nvim-tree.lua") -- File explorer
	use("akinsho/bufferline.nvim") -- Tabs
	use("moll/vim-bbye") -- Close files without closing windows
	use("nvim-lualine/lualine.nvim") -- Status line
	use("akinsho/toggleterm.nvim") -- Terminal

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
