local nvim_tree = require("nvim-tree")
local nt_api = require("nvim-tree.api")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function on_attach(bufnr)
    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    nt_api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set(
        'n',
        'T',
        function()
            local node = nt_api.tree.get_node_under_cursor()
            vim.cmd("tabe " .. vim.fn.fnameescape(node.absolute_path) .. "| tabprevious")
        end,
        opts('Open: New Tab in Background')
    )

    vim.keymap.set('n', 't', nt_api.node.open.tab, opts('Open: New Tab'))

    vim.keymap.set(
        'n',
        '<LeftRelease>',
        function ()
            local node = nt_api.tree.get_node_under_cursor()
            if node.type == "directory" then
                nt_api.node.open.edit(node)
            end
        end,
        opts('Toggle Directory')
    )
end

nvim_tree.setup({
    on_attach = on_attach,

    hijack_cursor = true,
    disable_netrw = true,

    view = {
        side = "right",
        signcolumn = "no",
    },

    git = {
      ignore = false,
    },
})
