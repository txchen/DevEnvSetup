local present, hop = pcall(require, "hop")

if not present then
   return
end

local options = {
  keys = 'etovxqpdygblzhckisuran'
}

options = require("core.utils").load_override(options, "phaazon/hop.nvim")

hop.setup(options)