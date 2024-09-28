return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- Optional dependency
    },
    
    config = function()
      -- Define the highlight setting function
      local function set_noice_highlights()
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "Include" }) -- Sets the BorderColor for the Cmdline Popup and base for almost everything else.
        vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "WarningMsg" }) -- Sets icon color in default mode
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleCmdline", { link = "Include" }) -- Sets title color in default mode 
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { link = "WarningMsg" }) -- Sets idk 

        vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { link = "Conceal" }) -- Sets default input text color

        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleSearch", { link = "Type" }) -- Sets title color in search mode
        vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { link = "Conceal" }) -- Sets icon color in search mode
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "Type" }) -- Sets border color in search mode
      end

      -- Call the function initially to set the highlights when starting Neovim
      set_noice_highlights()

      -- Create an autocommand to reapply the highlights whenever the colorscheme is changed
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_noice_highlights
      })

      -- Configure Noice plugin
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        presets = {
          bottom_search = false, -- classic bottom cmdline for search
          long_message_to_split = true, -- long messages sent to a split
          inc_rename = false, -- disable input dialog for inc-rename.nvim
          lsp_doc_border = false, -- no border for hover docs and signature help
        },
        cmdline = {
          enabled = true, -- enables the Noice cmdline UI
          view = "cmdline_popup", -- popup view for the cmdline
          opts = {}, -- global options for cmdline view
          format = {
            cmdline = { pattern = "^:", icon = "󰣖 ", lang = "vim", title = " Nya   " },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex", title = " 🐾 Searching... " },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex", title = " 🐾 Searching... " },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash", title = " 🐾 " },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua", title = " Lua?  "},
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖", title = "  󰋖 " },
            input = { view = "cmdline_input", icon = "󰥻 ", title = "   " },
            telescope = {pattern = "^:%s*Telescope%s+", lang = "vim", icon = "󰭎 ", title = "  󰭎  "},
          },
        },
      })
    end,
  }
}
