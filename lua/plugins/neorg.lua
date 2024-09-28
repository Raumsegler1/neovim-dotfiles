return {
    {
      "nvim-neorg/neorg",
      lazy = false,
      version = "*",
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.presenter"] = {
              config = {
                zen_mode = "zen-mode",
                keybinds = {
                    next_slide = "<Enter>", -- Move to the next slide
                    prev_slide = "<Backspace>" -- Move to the previous slide
                }
            }
          },
            ["core.summary"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
                  notes = "~/notes",
                },
                default_workspace = "notes",
              },
            },
          },
        }
  
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
      end,
    },
}
