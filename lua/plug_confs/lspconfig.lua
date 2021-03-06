-- LSP settings
local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(
    bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc'
  )
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--Forgot what this fixes
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- setup languages
-- cssmodules
nvim_lsp['cssmodules_ls'].setup{
  cmd = { "cssmodules-language-server" },
  filetypes = { "javascript", "javascriptreact",
                "typescript", "typescriptreact" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
  root_dir = nvim_lsp.util.root_pattern("package.json"),
}
-- python
nvim_lsp['pyright'].setup{
  cmd = { "pyright-langserver", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  },
  single_file_supprt = true
}
-- html
nvim_lsp['html'].setup{
    cmd = {'vscode-html-language-server', '--stdio'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {},
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    }
}
-- css, scss, less, sass
nvim_lsp['cssls'].setup{
  cmd = {'vscode-css-language-server', '--stdio'},
  filetypes = {'css', 'scss', 'less', 'sass'},
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require'lspconfig'.util.root_pattern("packer.json", ".git"),
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    },
  },
  single_file_supprt = true
}
-- typescript
nvim_lsp['tsserver'].setup{
    cmd = {'typescript-language-server', '--stdio'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
    }
}
-- GoLang
nvim_lsp['gopls'].setup{
  cmd = {'gopls'},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}
-- lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp['sumneko_lua'].setup {
	cmd = {'lua-language-server'},
	on_attach = on_attach,
	capabilities = capabilities,
  settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
  },
}
