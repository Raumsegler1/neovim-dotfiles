return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require("catppuccin").setup({
        transparent_background = false,
        flavor = "macchiato",
        integrations = {
          cmp = true,
          treesitter = true,
        }
      })
      --vim.cmd.colorscheme("catppuccin-mocha")  -- Set Catppuccin as your colorscheme
      vim.cmd.colorscheme("gruvbox")  -- Set Gruvbox as your colorscheme
      --vim.cmd.colorscheme("evangelion")  -- Set Evangelion as your colorscheme
    end,
  },

  {
    "ellisonleao/gruvbox.nvim", 
    priority = 1000 , 
    config = true, 
    opts = ...,
  },
  {
  "xero/evangelion.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    overrides = {
      keyword = { fg = "#00ff00", bg = "#222222", undercurl = false },
      ["@boolean"] = { link = "Special" },
    },
  },
  },
  {
    "shrikecode/kyotonight.vim"
  }
}
