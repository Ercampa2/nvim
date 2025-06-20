return
    -- {
    --     'catppuccin/nvim',
    --     name = 'catppucin',
    --     priority = 1000,
    --
    --     -- name="rose-pine",
    -- 	config = function()
    --         require'catppuccin'.setup{
    --             transparent_background = true,
    --         }
    --
    --         vim.cmd("colorscheme catppuccin")
    -- 	end
    --}
    -- {
    --   'olivercederborg/poimandres.nvim',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require('poimandres').setup {
    --         disable_background = true,
    --       -- leave this setup function empty for default config
    --       -- or refer to the configuration section
    --       -- for configuration options
    --     }
    --   end,
    --
    --   -- optionally set the colorscheme within lazy config
    --   init = function()
    --     vim.cmd("colorscheme poimandres")
    --   end
    -- {
    --  -- add dracula
    --  { "Mofiqul/dracula.nvim" },
    --
    --  -- Configure LazyVim to load dracula
    --  {
    --    "LazyVim/LazyVim",
    --    opts = {
    --      colorscheme = "dracula",
    --    },
    --  },   --

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            require'tokyonight'.setup{
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                }
            }
        end,
        init = function ()
            vim.cmd("colorscheme tokyonight-storm")
        end
    }
