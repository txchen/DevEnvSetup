local vim = vim
local M = {}

M.disabled = {
  i = {
      ["<C-b>"] = "",
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
  }
}

M.common = {
  n = {
    ["<F2>"] = { ":set invpaste paste?<CR>", "Toggle paste mode" },
    ["<F3>"] = { ":set wrap! wrap?<CR>", "Toggle wrap mode" },
    ["<C-q><C-q>"] = { "<ESC>:q!<CR>", "Quit without saving" },
    ["<C-s><C-s>"] = { ":wq<CR>", "Save and quit" },
    -- windows guy
    ["<C-a>"] = { "ggVG", "Select all" },
    -- ctrl + l / h, to navigate splits
    ["<C-l>"] = { "<C-w>w", "Go to next split" },
    ["<C-h>"] = { "<C-w>W", "Go to prev split" },
  },
  i = {
    ["<C-q><C-q>"] = { "<ESC>:q!<CR>", "Quit without saving"},
    ["<C-s>"] = { "<ESC>:w<CR>", "Save and goto normal mode" },
    ["<C-l>"] = { "<C-o><C-w>w", "Go to next split" },
    ["<C-h>"] = { "<C-o><C-w>W", "Go to prev split" },
    ["<C-c>"] = { "<ESC>", "Ctrl-c as real ESC" },
  },
  v = {
    ["<C-s>"] = { "<ESC>:w<CR>", "Save and goto normal mode" },
    -- indentation and keep selection
    ["<"] = { "<gv", "Save and goto normal mode" },
    [">"] = { ">gv", "Save and goto normal mode" },
    -- in visual mode, use J or K to move lines
    ["J"] = { ":m '>+1<CR>gv=gv", "Save and goto normal mode" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Save and goto normal mode" },
  }
}

M.telescope = {
  n = {
    -- like vscode
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files by file name" },
    -- a lot of apps use super+k to trigger search
    ["<C-k>"] = { "<cmd> Telescope live_grep <CR>", "Search by ripgrep" },
    -- search the current word
    ["?"] = { ":Telescope grep_string search=<C-R><C-W><CR>", "Search by ripgrep" },
  }
}

M.hop = {
  n = {
    ["<A-f>"] = { "<cmd> HopWord <CR>", "Hop word mode" },
  }
}

-- ctrl + / to toggle comment
M.comment = {
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,
      "toggle comment",
    },
  },
  i = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,
      "toggle comment",
    },
  },
  v = {
    ["<C-_>"] = {
      '<esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>',
      "toggle comment",
    },
  },
}

return M
