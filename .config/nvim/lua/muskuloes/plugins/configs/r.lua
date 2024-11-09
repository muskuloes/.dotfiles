return function()
  local r_ok, r = pcall(require, "r")

  if not r_ok then
    return
  end

  local opts = {}
  if vim.env.R_AUTO_START == "true" then
    opts.auto_start = "on startup"
    opts.objbr_auto_start = true
  end

  r.setup(opts)
end
