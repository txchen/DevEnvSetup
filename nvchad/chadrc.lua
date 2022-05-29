local M = {}

M.ui = {
   theme = "onedark",
   hl_override = {
      CursorLine = {
         bg = "one_bg",
      }
   },
   -- transparent is not good in this setup
   transparency = false,
}

M.plugins = {
   user = require "custom.plugins"
}

M.mappings = require "custom.mappings"

return M