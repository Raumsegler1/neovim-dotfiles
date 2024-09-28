return {
 {
    'preservim/nerdtree',
    config = function()
      	vim.g.NERDTreeWinSize = 30  -- Width of NERDTree window
	vim.g.NERDTreeShowHidden = 1 -- Show hidden files
	vim.api.nvim_set_keymap('n', '<c-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },
}
