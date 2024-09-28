return {
  {
    'akinsho/toggleterm.nvim',
    version = '2.*',  -- Check for the latest version if needed
    config = function()
      require("toggleterm").setup {
        size = 20,
        shade_filetypes = {},
	open_mapping = [[<c-t>]],		
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = true,
	shell = vim.o.shell,
        float_opts = {
          border = 'rounded',
          winblend = 0,
        }
      }
    end,
  },
}

