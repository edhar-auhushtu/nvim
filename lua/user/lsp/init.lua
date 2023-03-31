local ok, _ = pcall(require, "lspconfig")
if not ok then
	vim.notify("require lspconfig failed")
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
