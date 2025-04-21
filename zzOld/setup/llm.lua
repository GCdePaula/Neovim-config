--[[
require('llm').setup({
  model = "codellama",
  backend = "ollama",
  url = "http://localhost:11434/api/generate",

  request_body = {
    -- Modelfile options for the model you use
    options = {
      temperature = 0.2,
      top_p = 0.95,
    }
  },
  tokens_to_clear = { "<EOT>" },
  -- set this if the model supports fill in the middle
  fim = {
    enabled = true,
    prefix = "<PRE> ",
    middle = " <MID>",
    suffix = " <SUF>",
  },

  debounce_ms = 150,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<S-Tab>",
  tls_skip_verify_insecure = false,
  -- llm-ls configuration, cf llm-ls section
  lsp = {
    bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/llm_nvim/bin",
  },
  tokenizer = {
    repository = "codellama/CodeLlama-13b-hf",
  },
  context_window = 4096,
  enable_suggestions_on_startup = true,
  enable_suggestions_on_files = "*",   -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
  disable_url_path_completion = false, -- cf Backend
})
--]]
