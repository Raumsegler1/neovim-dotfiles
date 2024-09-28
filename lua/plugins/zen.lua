return {
-- Lua
{
  "folke/zen-mode.nvim",
  name = "zen-mode",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
  require("zen-mode").setup({
        plugins = {
          alacritty = {
            enabled = true,
            font = "16",
      }
        }
      })
  end,
}
}
