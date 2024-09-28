return {
  "epwalsh/pomo.nvim",
  version = "*",  -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  opts = {
    -- See below for full list of options 👇
    sticky = false,
    title_icon = "󱎫",
    text_icon = "󰄉",
  },
  config = function()
    require("pomo").setup({
      sessions = {
        pomodoro = {
          { name = "Work", duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work", duration = "25m" },
          { name = "Short Break", duration = "5m" },
          { name = "Work", duration = "25m" },
          { name = "Long Break", duration = "15m" },
        },
        catnap = {
          { name = "Code", duration = "30m" },
          { name = "nap", duration = "5m" },
          { name = "Code again", duration = "30m" },
          { name = "Loong nap", duration = "10m" },
          { name = "Coding, stay motivated NYA", duration = "30m" },
          { name = "stretch", duration = "5m" },
          { name = "P r o g r a m m i n g, NYA", duration = "30m" },
          { name = "relax time, NYA", duration = "30m" },
        },
      },
    })
  end,
}
