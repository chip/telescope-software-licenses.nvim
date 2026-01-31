local health = vim.health or require("health")

local M = {}

function M.check()
  health.start("telescope-software-licenses")

  -- Neovim version check
  local v = vim.version()

  if v.major > 0 or (v.major == 0 and v.minor >= 6) then
    health.ok("Neovim >= 0.6")
  else
    health.error("Neovim >= 0.6 is required")
  end

  -- Telescope availability
  local ok = pcall(require, "telescope")
  if ok then
    health.ok("telescope.nvim installed")
  else
    health.error("telescope.nvim not found")
  end
end

return M
