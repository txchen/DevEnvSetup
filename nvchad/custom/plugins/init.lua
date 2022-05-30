return {
  ["phaazon/hop.nvim"] = {
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "hop.nvim"
    end,
    config = function()
      require "custom.plugins.hop"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.null-ls").setup()
    end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  -- disable better-escape, I don't need jk to exit insert mode
  ["max397574/better-escape.nvim"] = {
    disable = true,
  }
}