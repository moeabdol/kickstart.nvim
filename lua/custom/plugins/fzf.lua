return {
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {
        winopts = {
          row = 1,
          height = 0.4,
          width = 1,
          border = 'none',
          preview = {
            horizontal = 'right:50%',
            default = 'bat_native',
          },
        },

        files = {
          prompt = 'Files❯ ',
          cwd_prompt = false,
          multiprocess = true,
          fd_opts = [[-L -tf -tl --hidden -E .git -E .cache -E .npm -E .node_modules -E *.pyc -E .nvm -E .venv -E .gradle]],
        },

        git = {
          status = {
            winopts = {
              fullscreen = true,
            },
          },
        },

        grep = {
          prompt = 'Rg❯ ',
          multiprocess = true,
          rg_opts = '--column --line-number --no-heading --hidden --color=always --smart-case --max-columns=4096 --glob=!.nvm/* --glob=!.npm/* --glob=!node_modules/* --glob=!.venv/*',
        },

        -- Keybindings
        vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<CR>'),
        vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>'),
        vim.keymap.set('n', '<leader>g', '<cmd>FzfLua git_status<CR>'),
        vim.keymap.set('n', '<C-x><C-p>', '<cmd>FzfLua live_grep_native<CR>'),
      }
    end,
  },
}
