local M = {}

M.ui = {
    theme = "onedark",
    hl_override = {
        CursorLine = {
            bg = "one_bg"
        }
    },
    -- transparent is not good in this setup
    transparency = false
}

M.plugins = {
    user = require "custom.plugins",
    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig"
        }
    },
    override = {
        ["nvim-treesitter/nvim-treesitter"] = {
            ensure_installed = {"html", "css", "javascript", "typescript", "json", "python", "vue"}
        }
    }
}

M.mappings = require "custom.mappings"

return M
