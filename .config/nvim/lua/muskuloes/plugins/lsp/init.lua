return function()
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  -- local wk_ok, wk = pcall(require, "whick-key")

  -- TODO: setup which-key doc

  if not (lspconfig_ok and cmp_nvim_lsp_ok) then
    return
  end

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  local function lsp_keymaps(bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

    vim.keymap.set("n", "<leader>ff", function()
      vim.lsp.buf.format { async = true }
    end, bufopts)

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format { async = true }
    end, { nargs = 0 })
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

  local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    lsp_keymaps(bufnr)
  end

  lspconfig.marksman.setup {}
  lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  }

  local mason_ok, mason = pcall(require, "mason")
  local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

  if not mason_ok then
    return
  end

  if not mason_lspconfig_ok then
    return
  end

  mason.setup {}

  mason_lspconfig.setup {
    ensure_installed = { "pyright", "sumneko_lua", "tsserver", "jsonls", "marksman", "bashls" },
  }
end
