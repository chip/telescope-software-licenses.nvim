local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local previewers = require "telescope.previewers"
local paths = require("telescope._extensions.software_licenses.paths")

local results = paths.get_menu_options()

local M = {}

M.find = function(telescope_opts)
  telescope_opts = vim.tbl_extend("keep", telescope_opts or {},
    require("telescope.themes").get_dropdown {})
  pickers.new(telescope_opts, {
    prompt_title = "Software Licenses extension for Telescope",
    finder = finders.new_table {
      results = results,
      entry_maker = function(entry)
        local title = entry[1]
        local spdx = entry[2]
        local display = string.format("%s [%s]", title, spdx)
        return { value = entry, display = display, ordinal = spdx }
      end
    },
    sorter = conf.generic_sorter(telescope_opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local license = {}
        local selection = action_state.get_selected_entry()
        if selection and selection.value and selection.value[2] then
          local spdx = selection.value[2]
          license = paths.read_license(spdx)
        end
        vim.api.nvim_put(license, "l", false, true)
      end)
      return true
    end,
    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry)
        local license = {}
        if entry and entry.value and entry.value[2] then
          license = paths.read_license(entry.value[2])
        end
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, license)
      end
    })
  }):find()
end

return M
