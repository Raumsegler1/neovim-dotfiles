return {
  -- Telescope setup
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Dependency required by Telescope
    config = function()
      local telescope = require('telescope')

      -- Basic Telescope configuration
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
          prompt_prefix = "🔍 ",
          selection_caret = "➜ ",
          path_display = { "truncate" },
        },
      })

      -- Load Telescope extensions here if any
      -- telescope.load_extension('fzf') -- Example for loading fzf extension
      
       -- Simple keybinding: Ctrl + p to find files
      vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
    end,
  },
}

