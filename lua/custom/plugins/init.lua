-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
}
