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
    ensure_installed = { "vim", "lua", "javascript", "css", "rust", "html", "typescript", "svelte" },
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

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- lspconfig
lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_flags = {
  debounce_text_changes = 150
}

lspconfig.html.setup {
    cmd = { "vscode-html-language-server", "--stdio" },
    capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags

}

lspconfig.cssls.setup {
    capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags

}

--lspconfig.tsserver.setup{}

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

lspconfig.svelte.setup {
    capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags

}

lspconfig.denols.setup {
    capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags

}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)


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
	flags = lsp_flags,
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

