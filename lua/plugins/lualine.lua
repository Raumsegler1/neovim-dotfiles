return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 
      'nvim-tree/nvim-web-devicons', 
      "meuter/lualine-so-fancy.nvim",
    },
    config = function()

      -- Load the 'auto' theme and modify the background for the 'normal' mode in section 'c'
      local auto_theme_custom = require('lualine.themes.auto')
      auto_theme_custom.normal.c.bg = 'none'

      -- Define a function that returns your custom string
      local function custom_string()
        return "Nya"
      end

      require('lualine').setup({
        options = {
          icons_enabled = true,
          --theme = auto_theme_custom,
          theme = pywal16,
          component_separators = '',
          section_separators = { left = '', right = '' },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { { 'fancy_mode', width = 6, separator = { right = '' }, right_padding = 2, }  },
          lualine_b = { 
            {'filename', separator = { right = '' }},
            {'fancy_branch', separator = { right = '' }}, 
          },
          lualine_c = {  '%=' }, -- Center section, dynamically styled
          lualine_x = {},
          lualine_y = { {'filetype' }, 'fancy_lsp_servers',  },
          lualine_z = {
            {'progress',  separator = { left = '' }, left_padding = 2, draw_empty = true }, 
            {'datetime', style = "%H:%M", separator = { left = "" }, left_padding = 1}, 
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
