local health = vim.health or require("health")
local M = {}

local vim_installed = function()
  return true
end

M.check = function()
  health.start("Start health check for telescope-software-licenses.nvim")
  if vim_installed() then
    health.ok("nvim version >= 0.6 installed")
  else
    health.error("please install nvim > 0.6")
  end

  local packages = {"telescope", "plenary.curl"}
  for _, package in pairs(packages) do
    local has_package, _ = pcall(require, package)
    if has_package then
      health.ok(string.format("%s is installed", package))
    else
      health.error(string.format("This plugin requires %s", package))
    end
  end
end

return M
