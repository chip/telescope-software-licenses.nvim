local json = require "telescope._extensions.software_licenses.json"

local M = {}

local _root -- cached plugin root

local function resolve_root()
  local matches = vim.api.nvim_get_runtime_file(
    "lua/telescope/_extensions/software_licenses",
    false
  )

  if #matches == 0 then
    error("software_licenses: failed to locate plugin root in runtimepath")
  end

  -- matches[1] =
  --   <root>/lua/telescope/_extensions/software_licenses
  return vim.fn.fnamemodify(matches[1], ":h:h:h:h")
end

function M.root()
  if not _root then
    _root = resolve_root()
  end
  return _root
end

function M.text_dir()
  return M.root() .. "/text"
end

function M.json_dir()
  return M.root() .. "/json"
end

function M.read_license(name)
  local file = M.text_dir() .. "/" .. name .. ".txt"
  return vim.fn.readfile(file)
end

function M.read_json()
  local file = M.json_dir() .. "/licenses.json"
  return table.concat(vim.fn.readfile(file), "\n")
end

function M.get_menu_options()
  local menu_options = {}
  local data = M.read_json()
  local decoded = json.decode(data)

  if decoded then
    for _, license in pairs(decoded.licenses) do
      if license['isDeprecatedLicenseId'] == false then
        local name = license['name']
        local licenseId = license['licenseId']
        if name and licenseId then
          table.insert(menu_options, { name, licenseId })
        end
      end
    end
  end

  return menu_options
end

return M
