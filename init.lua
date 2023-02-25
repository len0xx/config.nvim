require("general")
require("plugins")

-- nvim-tree
require("nvim-tree").setup {}
vim.cmd "NvimTreeToggle"

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
    ensure_installed = { "vim", "lua", "javascript", "css", "html", "rust", "typescript", "svelte" },
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
    }
}

require('gitsigns').setup {}

-- autocomplete
local cmp = require('cmp')

cmp.setup {
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' } -- For vsnip users.
        },
        {
            { name = 'buffer' }
        }
    )
}

  -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        {
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        },
        {
            { name = 'buffer' }
        }
    )
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        }
    )
})

require('mason').setup {}

-- lspconfig
lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    cmd = { "vscode-html-language-server", "--stdio" },
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities
}

lspconfig.cssls.setup {
    capabilities = capabilities,
}

--lspconfig.tsserver.setup{}

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

lspconfig.svelte.setup {
    capabilities = capabilities
}

lspconfig.denols.setup {
    init_options = {
        lint = true,
        enable = true,
        unstable = false
    },
    capabilities = capabilities
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    }
)

lspconfig.sqls.setup {
    settings = {
        sqls = {
            lowercaseKeywords = true,
            connections = {}
        }
    },
    capabilities = capabilities,
    on_attach = function(client, buffer)
        require('sqls').on_attach(client, buffer)
    end
}

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

require("toggleterm").setup {}

require("remap")
require("term")

