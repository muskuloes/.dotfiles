return function()
  local ok, sniprun = pcall(require, "sniprun")

  if not ok then
    return
  end

  sniprun.setup {
    display = { "VirtualTextOk", "TerminalWithCode" },
    repl_enable = { "Python3_original" },
  }
end
