return function()
  local ok, lualine = pcall(require, "lualine")

  if not ok then
    return
  end

  -- local config = lualine.get_config()
  local rstatus = function()
    if not vim.g.rplugin then
      -- No R file type (R, Quarto, Rmd, Rhelp) opened yet
      return ""
    end
    if vim.g.rplugin.jobs.R ~= 0 then
      -- R was launched and nvimrserver started its TCP server
      return "R"
    end
    if vim.g.rplugin.jobs.Server ~= 0 then
      -- nvimrserver was started
      return "S"
    else
      -- nvimrserver was not started yet
      return "-"
    end
  end

  local rsttcolor = function()
    if not vim.g.rplugin then
      return { fg = "#000000" }
    end
    if vim.g.rplugin.jobs.R ~= 0 then
      if vim.g.rplugin.R_pid == 0 then
        -- R was launched
        return { fg = "#ff8833" }
      else
        -- R started and informed its PID.
        -- This means nvimcom is running.
        return { fg = "#3388ff" }
      end
    end
    if vim.g.rplugin.jobs.Server ~= 0 and #vim.g.rplugin.libs_in_nrs > 0 then
      -- nvimrserver finished reading omni completion files
      return { fg = "#33ff33" }
    end
    return { fg = "#aaaaaa" }
  end
  local config = {
    options = {
      theme = "gruvbox",
    },
    sections = {
      lualine_b = { "branch", "diff" },
      lualine_y = { { rstatus, color = rsttcolor }, "progress" },
      lualine_z = { "location" },
    },
  }
  lualine.setup(config)
end
