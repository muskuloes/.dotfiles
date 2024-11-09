return function()
  local npairs_ok, npairs = pcall(require, "nvim-autopairs")
  local cmp_ok, cmp = pcall(require, "cmp")

  if not (npairs_ok and cmp_ok) then
    return
  end

  npairs.setup {
    check_ts = true,
    ts_config = {
      lua = { "string" },
    },
  }

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
