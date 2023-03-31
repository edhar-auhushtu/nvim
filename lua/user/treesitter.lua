local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("require treesitter failed")
  return
end

configs.setup {
  ensure_installed = { "c", "lua", "vim", "help", "query" },
  sync_install = false,
  ignore_install = { "" },
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

