local lsp = require 'lspconfig'
local common = require 'setup.languages.common'

lsp.solc.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  cmd = { "solc-0.8.13", "--include-path", "lib", "--lsp" },
}


vim.cmd([[
autocmd FileType solidity setlocal commentstring=//\ %s
]])

--- tree-sitter
local file = require "utils.file"
local queries = require "vim.treesitter.query"
local parsers = require "nvim-treesitter.parsers"
local api = vim.api
local fn = vim.fn

local function get_local_parser_dir(path)
  local config_path = fn.stdpath "config"
  return config_path .. "/tree-sitter-parsers/" .. path
end

local function get_local_query_dir(path)
  local parser_dir = get_local_parser_dir(path)
  return parser_dir .. "/queries"
end

local function get_local_query_file(path, query)
  local parser_dir = get_local_query_dir(path)
  return parser_dir .. "/" .. query .. ".scm"
end

local function set_query(name, parser, query)
  local path = get_local_query_file(parser, query)
  local query_str = file.try_read_all(path)
  if query then
    queries.set_query(name, query, query_str)
  else
    local err_str = string.format(
      "Failed to read tree-sitter query path `%s`\n",
      path
    )
    api.nvim_err_writeln(err_str)
  end
end

local parser_config = parsers.get_parser_configs()

parser_config.solidity = {
  install_info = {
    url = get_local_parser_dir("tree-sitter-solidity"),
    files = {"src/parser.c"},
    branch = "master",
  },
  filetype = "solidity",
}

-- Set local queries
local local_queries = {
  solidity = {
    parser = "tree-sitter-solidity",
    queries = {"highlights", "locals", "tags"}
  }
}

for name,v in pairs(local_queries) do
  local parser = v.parser
  for _,query in ipairs(v.queries) do
    set_query(name, parser, query)
  end
end
