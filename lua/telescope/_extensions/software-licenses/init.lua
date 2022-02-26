local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local find = require("telescope._extensions.software-licenses.find")
local health = require("telescope._extensions.software-licenses.health")
return telescope.register_extension {
  setup = function(opts) return opts end,
  exports = {find = find.licenses, health = health.check}
}
