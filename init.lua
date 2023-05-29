require("general")
require("plugins")

-- nvim-tree
require("nvim-tree").setup {
	git = {
		ignore = false
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false
			}
		}
	}
}

--telescope
local telescope = require('telescope')
telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules", ".git"
        }
    }
}

--treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = { "php", "vim", "lua", "javascript", "css", "rust", "html", "python", "typescript", "tsx", "svelte", "vue", "prisma" },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true
    },
    textobjects = {
        enable = true
    },
    indent = {
        enable = true
    },
	autotag = {
		enable = true
	}
}

require('gitsigns').setup {}

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

require('mason').setup {}

--themes
vim.opt.background = 'dark'
vim.cmd "colorscheme github_dark_default"
require("github-theme").setup {
    theme_style = "dark_default",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
}

require('lualine').setup {
    options = {
        theme = 'auto'
    }
}

require("lspsaga").setup {}
require("typescript").setup {}

require("bufferline").setup {
    options = {
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'NeoVim',
                text_align = 'center',
                separator = true
            }
        }
    }
}

require("remap")
require("lsp")
require("autocomplete")
