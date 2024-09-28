vim.opt.autoindent = true             -- Indent: Copy indent from current line when starting new line
vim.opt.clipboard = "unnamedplus"     -- Sync clipboard between OS and Neovim
vim.opt.colorcolumn = "120"           -- Show vertical bar to indicate 120 chars
vim.opt.cursorline = true             -- Highlight the cursor line
vim.opt.expandtab = true              -- Use spaces to insert a tab

-- Set indentation to 2 spaces
vim.opt.tabstop = 2         -- Number of spaces that a tab character represents
vim.opt.shiftwidth = 2      -- Number of spaces used for each step of (auto)indent
vim.opt.softtabstop = 2     -- Number of spaces that the Tab key inserts/removes in insert mode

-- Line numbers: Show current line, but use relative numbers elsewhere
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = true               -- Highlight results
vim.opt.incsearch = true              -- Show results as you type
vim.opt.ignorecase = true             -- Ignore case
vim.opt.smartcase = true              -- unless uppercase chars are given

vim.opt.wrap = false
