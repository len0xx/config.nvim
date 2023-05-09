local on_attach = function(_client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.clangd.setup{
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.html.setup {
	cmd = { "vscode-html-language-server", "--stdio" },
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.cssls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.phpactor.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("composer.json", ".git", "index.php"),
	init_options = {
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false
	}
}

lspconfig.lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			}
		}
	}
}

lspconfig.pyright.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.tsserver.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("package.json"),
	single_file_support = false
}

lspconfig.denols.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json")
}

lspconfig.svelte.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}


lspconfig.volar.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		typescript = {
			tsdk = "/opt/homebrew/lib/node_modules/typescript/lib"
			-- tsdk = "/usr/local/lib/node_modules/typescript/lib"
		}
	}
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
