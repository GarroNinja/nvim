function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require 'alpha.themes.startify'
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = 'mini'
      require('alpha').setup(startify.config)
    end,
  },
  {
    'echasnovski/mini.files',
    version = false, -- Use `false` for the latest version (main branch)
    config = function()
      require('mini.files').setup()

      -- Keybinding to open MiniFiles easily
      vim.keymap.set('n', '<leader>e', MiniFiles.open, { desc = 'Open MiniFiles' })
    end,
  },
  {
    'echasnovski/mini.icons',
    version = false, -- Use `false` for the latest version (main branch)
    config = function()
      require('mini.icons').setup {
        style = 'glyph', -- Use 'ascii' if glyphs don't render properly
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    vim.keymap.set('n', '<Space>t', ':ToggleTerm<CR>', { noremap = true, silent = true }),
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()',
  },
  { vim.keymap.set('n', '<Space>n', ':Neotree toggle<CR>', { noremap = true, silent = true }) },
}
