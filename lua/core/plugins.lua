---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim
local path = require("tools.path")

local packer_install_plugins = {
    -------------
    --- basic ---
    -------------
    -- packer package manager
    {"wbthomason/packer.nvim"},
    -- optimized startup speed
    {"lewis6991/impatient.nvim", load_file = true},
    -- speed up startup
    {"nathom/filetype.nvim", load_file = true},
    -- icon support
    {"kyazdani42/nvim-web-devicons", after = "impatient.nvim"},
    -- chinese documentation
    {"yianwillis/vimcdoc", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- lua dependency
    {"nvim-lua/plenary.nvim", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- character lookup
    {"BurntSushi/ripgrep", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- file lookup
    {"sharkdp/fd", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -------------
    ---- lsp ----
    -------------
    -- lsp base plug-in
    {"neovim/nvim-lspconfig", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- view tree
    {"stevearc/aerial.nvim", load_file = true, after = {"nvim-web-devicons", "nvim-lspconfig", "impatient.nvim"}},
    -- replace the built-in omnifunc completion to get more completion
    {"hrsh7th/cmp-nvim-lsp", after = {"nvim-web-devicons", "nvim-lspconfig"}},
    -- download lsp automatically
    {"williamboman/nvim-lsp-installer", load_file = true, after = {"cmp-nvim-lsp", "aerial.nvim"}},
    -- lsp progress prompts
    {"j-hui/fidget.nvim", load_file = true, after = "nvim-lsp-installer"},
    -- lsp ui beautification
    {"tami5/lspsaga.nvim", load_file = true, after = "nvim-lsp-installer"},
    -- extended lsp diagnostics
    {"mfussenegger/nvim-lint", load_file = true, after = "nvim-lsp-installer"},
    -- bulb hint code behavior
    {"kosayoda/nvim-lightbulb", load_file = true, after = "nvim-lsp-installer"},
    -- insert mode gets the function signature
    {"ray-x/lsp_signature.nvim", load_file = true, after = "impatient.nvim"},
    -------------
    -- complete -
    -------------
    -- vsnip engine for code snippet support
    {"hrsh7th/vim-vsnip", event = {"InsertEnter", "CmdlineEnter"}, after = "impatient.nvim"},
    -- adds a vscode-like icon for completion
    {"onsails/lspkind-nvim", event = {"InsertEnter", "CmdlineEnter"}, after = "impatient.nvim"},
    -- code completion
    {"hrsh7th/nvim-cmp", load_file = true, after = {"lspkind-nvim", "vim-vsnip"}},
    -- source of code snippets for vsnip
    {"hrsh7th/cmp-vsnip", after = "nvim-cmp"},
    -- path completion
    {"hrsh7th/cmp-path", after = "nvim-cmp"},
    -- buffer completion
    {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
    -- command completion
    {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
    -- sql completion
    {"kristijanhusak/vim-dadbod-completion", after = "nvim-cmp"},
    -- provides code snippets in multiple languages
    {"rafamadriz/friendly-snippets", after = "nvim-cmp"},
    -- tabnine source that provides ai-based intelligent completion
    {"tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp", disable = false},
    -- git copilot is autocompleted
    {"github/copilot.vim", load_file = true, disable = false},
    -------------
    ---- dap ----
    -------------
    -- code debugging basic plugin
    {"mfussenegger/nvim-dap", load_file = true, module = "dap", after = "impatient.nvim"},
    -- provides inline text for code debugging
    {"theHamsta/nvim-dap-virtual-text", load_file = true, after = "nvim-dap"},
    -- provides a ui interface for code debugging
    {"rcarriga/nvim-dap-ui", load_file = true, after = "nvim-dap"},
    -------------
    --- theme ---
    -------------
    -- excellent dark theme
    {"catppuccin/nvim", as = "catppuccin", disable = false, load_file = true, after = "impatient.nvim"},
    -- high contrast theme
    {"sainnhe/sonokai", disable = true, load_file = true, after = "impatient.nvim"},
    -- provides a default highlighting scheme for themes that do not support lsp highlighting
    {"folke/lsp-colors.nvim", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- syntax highlighting
    {"nvim-treesitter/nvim-treesitter", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- rainbow parentheses
    {"p00f/nvim-ts-rainbow", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- provides contextual information for the status bar
    {"SmiteshP/nvim-gps", after = {"nvim-treesitter", "impatient.nvim"}},
    -- git plugin
    {"lewis6991/gitsigns.nvim", load_file = true, after = {"nvim-treesitter", "plenary.nvim"}},
    -- lightweight status bar plugin
    {"nvim-lualine/lualine.nvim", load_file = true, after = {"nvim-gps", "gitsigns.nvim", "nvim-web-devicons"}},
    -- beautiful pop-ups
    {"rcarriga/nvim-notify", load_file = true, after = "impatient.nvim"},
    -- displays the scroll bar
    {"petertriho/nvim-scrollbar", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- displays the same word under the cursor
    {"RRethy/vim-illuminate", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -------------
    --- code ----
    -------------
    -- comment dependencies
    {"JoosepAlviste/nvim-ts-context-commentstring", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- code comments
    {"numToStr/Comment.nvim", load_file = true, after = "nvim-ts-context-commentstring"},
    -- code formatting
    {"sbdchd/neoformat", load_file = true, cmd = "Neoformat", after = "impatient.nvim"},
    -- quickly change words
    {"AndrewRadev/switch.vim", load_file = true, cmd = "Switch", after = "impatient.nvim"},
    -- python indentation
    {"Vimjas/vim-python-pep8-indent", ft = "python", after = "impatient.nvim"},
    -- emmet abbreviation
    {"mattn/emmet-vim", ft = {"html", "javascript", "typescript", "vue", "xml"}, after = "impatient.nvim"},
    -- sql linking base plugin
    {"tpope/vim-dadbod", cmd = "DBUIToggle", after = "impatient.nvim"},
    -- sql link ui plugin
    {"kristijanhusak/vim-dadbod-ui", load_file = true, after = "vim-dadbod"},
    -- package modification
    {"ur4ltz/surround.nvim", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- automatically matches parentheses
    {"windwp/nvim-autopairs", load_file = true, event = "InsertEnter", after = "impatient.nvim"},
    -- todo tree
    {"folke/todo-comments.nvim", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- displays indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        load_file = true,
        event = {"BufRead", "BufNewFile"},
        after = "impatient.nvim"
    },
    -------------
    -- function -
    -------------
    -- session manager
    {"olimorris/persisted.nvim", load_file = true, after = "impatient.nvim"},
    -- deleting buffer does not affect existing layouts
    {"famiu/bufdelete.nvim", event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- supports the buffer bar for lsp status
    {"akinsho/bufferline.nvim", load_file = true, after = {"nvim-web-devicons", "bufdelete.nvim"}},
    -- file tree
    {
        "kyazdani42/nvim-tree.lua",
        load_file = true,
        cmd = {"NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFocus"},
        after = {"nvim-web-devicons"}
    },
    -- undo tree
    {"mbbill/undotree", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- fuzzy lookup
    {
        "nvim-telescope/telescope.nvim",
        load_file = true,
        module = "telescope",
        after = {"fd", "ripgrep", "nvim-web-devicons"}
    },
    -- alternate
    {"nvim-pack/nvim-spectre", load_file = true, module = "spectre", after = {"ripgrep", "plenary.nvim"}},
    -- markdown preview
    {"davidgranstrom/nvim-markdown-preview", load_file = true, ft = "markdown", after = "impatient.nvim"},
    -- built-in terminal
    {
        "akinsho/toggleterm.nvim",
        load_file = true,
        module = "toggleterm",
        event = "CmdUndefined",
        after = "impatient.nvim"
    },
    -- multi-cursor mode
    {"mg979/vim-visual-multi", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- auto save
    {"Pocco81/AutoSave.nvim", load_file = true, event = {"TextChanged", "TextChangedI"}, after = "impatient.nvim"},
    -- automatically restores the cursor position
    {"ethanholz/nvim-lastplace", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- displays entries when searching
    {"kevinhwang91/nvim-hlslens", module = "hlslens", after = "impatient.nvim"},
    -- displays the web color
    {"norcalli/nvim-colorizer.lua", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- quick jumps
    {"phaazon/hop.nvim", load_file = true, cmd = {"HopWord", "HopLine", "HopChar1"}, after = "impatient.nvim"},
    -- spell checker
    {"lewis6991/spellsitter.nvim", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- key binder
    {"folke/which-key.nvim", load_file = true, event = {"BufRead", "BufNewFile"}, after = "impatient.nvim"},
    -- translation plugins
    {"uga-rosa/translate.nvim", load_file = true, cmd = "Translate", after = "impatient.nvim"},
    -- drawing tools
    {"jbyuki/venn.nvim", load_file = true, event = "FuncUndefined", after = "impatient.nvim"},
    -- long screenshot of the code
    {"kristijanhusak/vim-carbon-now-sh", cmd = "CarbonNowSh", after = "impatient.nvim"},
    -- query the startup time
    {"dstein64/vim-startuptime", cmd = "StartupTime", after = "impatient.nvim"}
}

local packer = require("packer")

Packer_bootstrap =
    (function()
    local packer_install_path = path.join(vim.fn.stdpath("data"), "site/pack/packer/start/packer.nvim")
    if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
        return vim.fn.system(
            {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                packer_install_path
            }
        )
    end
end)()

packer.startup(
    {
        function(use)
            for _, plugin in ipairs(packer_install_plugins) do
                if plugin.load_file then
                    local require_path
                    if plugin.as then
                        require_path = path.join("configure", "plugins", plugin.as)
                    else
                        require_path = path.join("configure", "plugins", string.match(plugin[1], "/([%w-_]+).?"))
                    end
                    plugin.config = "require('" .. require_path .. "')"
                end
                use(plugin)
            end
            if Packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

vim.cmd(
    [[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
   augroup end
 ]]
)

return packer
