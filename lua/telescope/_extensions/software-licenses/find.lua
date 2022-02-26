local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local previewers = require "telescope.previewers"
local licenses = require('telescope._extensions.software-licenses.licenses')
local results = {}

function string:split(sep)
  sep = sep or "\n"
  local fields = {}
  local pattern = string.format("([^%s]+)", sep)
  for match, _ in self:gmatch(pattern) do table.insert(fields, match) end
  return fields
end

for _, license in ipairs(licenses) do
  local name = license.name
  local text = license.text:split()
  table.insert(results, {name, text})
end

local M = {}

M.licenses = function(telescope_opts)
  telescope_opts = vim.tbl_extend("keep", telescope_opts or {},
                                  require("telescope.themes").get_dropdown {})
  pickers.new(telescope_opts, {
    prompt_title = "telescope-software-licenses",
    finder = finders.new_table {
      results = results,
      entry_maker = function(entry)
        return {value = entry, display = entry[1], ordinal = entry[1]}
      end
    },
    sorter = conf.generic_sorter(telescope_opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_put(selection.value[2], "l", false, true)
      end)
      return true
    end,
    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry)
        local output = entry.value[2]
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, output)
      end
    })
  }):find()
end

return M
