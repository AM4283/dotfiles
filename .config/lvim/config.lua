--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
-- set theme variant, matching terminal theme if unset
-- @usage 'main' | 'moon' | 'dawn'
vim.g.rose_pine_variant = 'main'
lvim.format_on_save = false
lvim.colorscheme = "rose-pine"
lvim.builtin.lualine.theme = "rose-pine"
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "nord"
-- lvim.colorscheme = "dracula"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.wrap = true
vim.cmd('let g:suda_smart_edit = 1')
vim.opt.guifont = "Fira Code:h11"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
-- vim.cmd("cmap ww<cr> w<cr> :silent! !~/.config/scripts/refresh<cr>")

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["m"] = {
  name = "+Markdown/Maven",
  d = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" },
  p = {"<cmd>TermExec cmd=\"mvn package\"<CR>", "Package"},
  t = {"<cmd>TermExec cmd=\"mvn test\"<CR>", "Test"},
  c = {"<cmd>TermExec cmd=\"mvn compile\"<CR>", "Complie"},
  i = {"<cmd>TermExec cmd=\"mvn install\"<CR>", "Install"},
  v = {"<cmd>TermExec cmd=\"mvn verify\"<CR>", "Verify"},
  u = {"<cmd>TermExec cmd=\"mvn clean\"<CR>", "Clean"},
  b = {"<cmd>TermExec cmd=\"mvn package && $HOME/java-projects/execjava.sh\"<CR>", "Package and Run"},
  r = {"<cmd>TermExec cmd=\"$HOME/java-projects/execjava.sh\"<CR>", "Run Main Jar"}
}
lvim.builtin.which_key.mappings["="] = { "<cmd>vnew term://zsh<CR>", "Open Terminal" }
lvim.builtin.which_key.mappings["\\"] = { "<cmd>RnvimrToggle<CR>", "Ranger" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
-- vim.cmd ("let g:indentLine_char = '|'")
-- vim.g["indentLine_fileTypeExclude"] = { 'dashboard', 'WhichKey', 'man', 'terminal', 'help' }
-- vim.g["indentLine_bufTypeExclude"] = { 'terminal' }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
-- vim.cmd("let g:minimap_auto_start = 0")
-- vim.cmd("let g:minimap_auto_start_win_enter = 0")
vim.cmd("let g:scrollbar_excluded_filetypes = ['nerdtree', 'tagbar', 'help', 'terminal', 'dashboard', 'packer', 'minimap', 'WhichKey', 'man']")
vim.cmd("let g:scrollbar_excluded_buftypes = ['terminal']")

-- Additional Plugins
lvim.plugins = {
    {"lunarvim/colorschemes"},
    {"folke/tokyonight.nvim"},
    {"tiagovla/tokyodark.nvim"},
    {"shaunsingh/nord.nvim"},
    {"Mofiqul/dracula.nvim"},
    {
      'rose-pine/neovim',
      as = 'rose-pine',
      tag = 'v0.*',
    },
    {"mangeshrex/uwu.vim"},
    {"lourenci/github-colors"},
    -- {
    --   'wfxr/minimap.vim',
    --   run = "cargo install --locked code-minimap",
    --   -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    --   config = function ()
    --     vim.cmd ("let g:minimap_width = 10")
    --     vim.cmd ("let g:minimap_auto_start = 0")
    --     vim.cmd ("let g:minimap_auto_start_win_enter = 0")
    --   end,
    -- },
    {"Xuyuanp/scrollbar.nvim"},
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "packer", "minimap", "WhichKey", "man"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end
    },
-- debugging
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "kevinhwang91/nvim-bqf",
      event = { "BufRead", "BufNew" },
      config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
      end,
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("spectre").setup()
      end,
    },
-- save as root
    {"lambdalisue/suda.vim"},
-- markdown preview
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
-- i3 and sxhkd syntax
    {"PotatoesMaster/i3-vim-syntax"},
    {"kovetskiy/sxhkd-vim"},
-- colorizer
    {
      "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup({ "*" }, {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              RRGGBBAA = true, -- #RRGGBBAA hex codes
              rgb_fn = true, -- CSS rgb() and rgba() functions
              hsl_fn = true, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
              })
      end,
    },
-- lsp enhancements
    {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
      event = "InsertEnter",
    },
    {
      "rmagatti/goto-preview",
      config = function()
      require('goto-preview').setup {
            width = 120; -- Width of the floating window
            height = 25; -- Height of the floating window
            default_mappings = true; -- Bind default mappings
            debug = false; -- Print debug information
            opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
            post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
            -- You can use "default_mappings = true" setup option
            -- Or explicitly set keybindings
            -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
            -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
            -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
        }
      end
    },
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
      setup = function()
        vim.cmd [[packadd telescope.nvim]]
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end
    },
    {
      "folke/lsp-colors.nvim",
      event = "BufRead",
    },
-- git
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },

    -- {
    --   "f-person/git-blame.nvim",
    --   event = "BufRead",
    --   config = function()
    --     vim.cmd "highlight default link gitblame SpecialComment"
    --     vim.g.gitblame_enabled = 0
    --   end,
    -- },
-- treesitter enhancements
    {
      "p00f/nvim-ts-rainbow",
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },
-- Ranger file explorer
    {
      "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        config = function()
          vim.g.rnvimr_draw_border = 1
          vim.g.rnvimr_pick_enable = 1
          vim.g.rnvimr_bw_enable = 1
          end,
    },
-- Automatically update browser js, css, html
    {
      "turbio/bracey.vim",
      cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
      run = "npm install --prefix server",
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  -- { "TermOpen", "*", "IndentLinesDisable" },
  { "BufWinEnter", "*.html", "TSBufDisable highlight" },
  { "BufWritePost", "~/suckless/dwmblocks/blocks.h", "!cd ~/suckless/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }" },
  { "BufWritePost", "~/suckless/dwm/config.h", "!cd ~/suckless/dwm/; sudo make clean install" },
  { "BufWritePost", "~/suckless/dwm/config.def.h", "!cd ~/suckless/dwm/; cp config.def.h config.h && sudo make clean install"},
  { "BufWritePost", "~/suckless/dwmorig/config.h", "!cd ~/suckless/dwmorig/; sudo make clean install" },
  { "BufWritePost", "~/suckless/dwmorig/config.def.h", "!cd ~/suckless/dwmorig/; cp config.def.h config.h && sudo make clean install"},
  { "BufWritePost", "~/.dwmblocks/blocks.h", "!cd ~/.dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }" },
  { "BufWritePost", "~/.dwm/config.h", "!cd ~/.dwm/; sudo make clean install" },
  { "BufWritePost", "~/.dwm/config.def.h", "!cd ~/.dwm/; cp config.def.h config.h && sudo make clean install"},
  { "BufWritePost", "~/.Xresources", "!xrdb ~/.Xresources"},
  { "WinScrolled,VimResized,QuitPre", "*", "silent! lua require('scrollbar').show()"},
  { "WinEnter,FocusGained", "*", "silent! lua require('scrollbar').show()"},
  { "WinLeave,BufLeave,BufWinLeave,FocusLost", "*", "silent! lua require('scrollbar').clear()"}
}
