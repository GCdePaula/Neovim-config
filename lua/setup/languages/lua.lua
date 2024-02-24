local file = require 'utils.file'
local lsp = require 'lspconfig'
local common = require 'setup.languages.common'
local vim_fn = vim.fn
local vim_api = vim.api

local allowed_versions = {
  ["Lua 5.1"] = true,
  ["Lua 5.2"] = true,
  ["Lua 5.3"] = true,
  ["Lua 5.4"] = true,
  ["LuaJIT"] = true,
}

local function runtime_and_version(runtime_str)
  runtime_str = runtime_str or "Lua 5.4"
  if not allowed_versions[runtime_str] then
    runtime_str = "Lua 5.4"
  end

  local p = string.gmatch(runtime_str, "[^%s]+")
  local x1, x2 = p(), p()

  if x1 == "LuaJIT" then
    return "LuaJIT", "5.1"
  else
    return runtime_str, x2
  end
end

local function get_settings(runtime_str, add_nvim_libs)
  local runtime, version = runtime_and_version(runtime_str)

  local function subs(s)
    return string.format(s, version)
  end

  local function subs_expand(s)
    return vim_fn.expand(subs(s))
  end

  local settings = {
    runtime = {
      version = runtime,

      path = {
        '?.lua',
        '?/init.lua',
        subs_expand '~/.luarocks/share/lua/%s/?.lua',
        subs_expand '~/.luarocks/share/lua/%s/?/init.lua',
      }
    },

    workspace = {
      library = {
        subs_expand '~/.luarocks/share/lua/%s',
      }
    },

    telemetry = {
      enable = false,
    },
  }

  if add_nvim_libs then
    table.insert(
      settings.workspace.library,
      vim_api.nvim_get_runtime_file("", true)
    )
  end

  return { Lua = settings }
end

local function parse_luarc()
  local p = vim_fn.findfile(".luarc.json", ".;")
  if not p then return false end

  local s = file.try_read_all(p)
  if not s then return false end

  local json = require "utils.json"
  local ok, output = pcall(json.decode, s)
  if not ok then return false end

  return true, output
end

local function is_nvim_config(j)
  local vs = j["Lua.diagnostics.globals"] or j["diagnostics.globals"]
  if not vs then return false end

  for _, v in ipairs(vs) do
    if v == "vim" then
      return true
    end
  end

  return false
end

local function get_lua_version(j)
  local v = j["Lua.runtime.version"] or j["runtime.version"]
  return v or false
end


local settings
do
  local version, add_nvim_libs

  local ok, output = parse_luarc()
  if ok and output then
    version = get_lua_version(output)
    add_nvim_libs = is_nvim_config(output)
  end

  settings = get_settings(version, add_nvim_libs)
end

lsp.lua_ls.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  settings = settings,
}
