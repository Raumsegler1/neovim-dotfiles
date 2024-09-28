-- lua/plugins/syntax.lua
return {
  -- Syntax Highlighting Setup
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "lua", "python", "javascript", "html", "css", "ruby", "vimdoc" }, -- Add Ruby here
        highlight = {
          enable = true, -- Enable syntax highlighting
	  disable = function(lang, buf)
            local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
            -- Disable for 'help' filetype or any other filetypes causing issues
            return ft == "help" or lang == nil
          end,     
  	},
        indent = {
          enable = true,                -- Optional: Enable better indentation
        },
        endwise = {
          enable = true,
          debug = true,
        },
      })
    end,
  },
        
  {
   'cohama/lexima.vim',
  },
}
