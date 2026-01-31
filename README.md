# telescope-software-licenses.nvim

This [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
extension allows you to view common software licenses and paste them into a buffer.

## ATTRIBUTION: https://spdx.org/licenses/

Currently supports hundreds of licenses via
[spdx/license-list-data](https://github.com/spdx/license-list-data/blob/main/json/licenses.json)
that spdx.org maintains.

## Do you need assistance choosing a license?

Check out [https://creativecommons.org/chooser/](https://creativecommons.org/chooser/)

## DEMO

![telescope-software-licenses.nvim DEMO](assets/demo.gif "telescope-software-licenses.nvim DEMO")

## REQUIREMENTS

- Neovim (v0.6.0)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (required)
- *Only tested on MacOS 11.6.1 and Tahoe 26.2 on M2*

## INSTALL

You can install the extension by using your plugin manager of choice or by
cloning this repository somewhere on your filepath, and then adding the
following somewhere after telescope in your configuration file.

### USING [Lazy](https://lazy.folke.io)
```lua
{
  "chip/telescope-software-licenses.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", },
},
```

## SETUP

### COMMANDS

```vim
:Telescope software_licenses find
```

### KEY MAPPINGS

```vim
" Replace <Leader>sl with whatever you prefer
nnoremap <Leader>sl :Telescope software_licenses find<CR>
```

### HEALTH CHECK

```
:checkhealth software_licenses
```

Or use the default health check:
```
:checkhealth
```
