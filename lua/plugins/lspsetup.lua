return {
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
      },
      config = function()
         require("mason-null-ls").setup({
            ensure_installed = {}
         })                                 -- require your null-ls config here (example below)
         require("null-ls").setup({
           sources = {
           },
         })
      end,
    },
    {
    -- Mason Setup
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',  -- Mason integration with nvim-lspconfig
      'neovim/nvim-lspconfig',              -- Core LSP configuration
      'nvimtools/none-ls.nvim',             -- Optional: Linting and formatting

      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- Initialize Mason
      require('mason').setup()

      -- Ensure that Ruby LSP is installed
      require('mason-lspconfig').setup({
        ensure_installed = { 'ruby_lsp' },
      })

      -- Automatically set up LSP servers via nvim-lspconfig
      local lspconfig = require('lspconfig')

      -- Configure Ruby LSP
      require('mason-lspconfig').setup_handlers({
        -- Default handler for LSP servers
        function(server_name)
          lspconfig[server_name].setup({})
        end,

        -- Ruby LSP specific configuration
        ['ruby_lsp'] = function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          lspconfig.ruby_lsp.setup({
            filetypes = { 'ruby' },
            root_dir = require('lspconfig.util').root_pattern('.git', 'Gemfile'),
            init_options = {
              formatter = 'rubocop',
              linters = { 'rubocop' },
            },
            single_file_support = true,
            capabilities = capabilities,  -- Link nvim-cmp capabilities
          })
        end,
      })
    end,
  },
  {
    -- Code Completion Setup
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',     -- Buffer source
      'hrsh7th/cmp-path',       -- Path source
      'L3MON4D3/LuaSnip',       -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
      'neovim/nvim-lspconfig',  -- LSP configuration
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      -- Set completeopt
      vim.o.completeopt = "menu,menuone,noselect"

      -- Setup nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' }
        }),
      })
    end,
  },
}
