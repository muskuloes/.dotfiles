return function()
  local cmp_ok, cmp = pcall(require, "cmp")
  local lspkind_ok, lspkind = pcall(require, "lspkind")
  local luasnip_ok, luasnip = pcall(require, "luasnip")

  if not (cmp_ok and lspkind_ok and luasnip_ok) then
    return
  end

  require("luasnip/loaders/from_vscode").lazy_load()

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ["<c-k>"] = cmp.mapping.select_prev_item(),
      ["<c-j>"] = cmp.mapping.select_next_item(),
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),
      ["<c-c>"] = cmp.mapping.complete(),
      ["<cr>"] = cmp.mapping.confirm { select = true },
      ["<c-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    formatting = {
      format = lspkind.cmp_format {
        mode = "symbol",
        maxwidth = 50,
        menu = {
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
          latex_symbols = "[Tex]",
          pandoc_references = "[Ref]",
          emoji = "[Emoji]",
          calc = "[Calc]",
          otter = "[Otter]",
          cmp_r = "[R]"
        },
      },
    },
    sources = {
      { name = "otter" },
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lua", keyword_length = 5, max_item_count = 3 },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 5, max_item_count = 3 },
      { name = "latex_symbols", option = { strategy = 0 } },
      { name = "pandoc_references" },
      { name = "emoji" },
      { name = "calc" },
      { name = "cmp_r" },
    },
    view = {
      entries = "native",
    },
    experimental = {
      ghost_text = true,
    },
  }
end
