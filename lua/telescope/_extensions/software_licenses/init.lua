local find = require("telescope._extensions.software_licenses.find")

return require("telescope").register_extension({
  exports = {
    find = find.find,
  },
})
