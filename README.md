# telescope-software-licenses.nvim

![telescope-software-licenses.nvim DEMO](assets/telescope-software-licenses.gif "telescope-software-licenses.nvim DEMO")

This [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
extension 

## Requirements

- Neovim (v0.6.0)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (required)
- *Only tested on MacOS 11.6.1*

## Install

You can install the extension by using your plugin manager of choice or by
cloning this repository somewhere on your filepath, and then adding the
following somewhere after telescope in your configuration file (`init.vim` or
`init.lua`).

### Using [Paq](https://github.com/savq/paq-nvim)
```lua
require "paq" {
  { 'nvim-lua/plenary.nvim' };
  { 'nvim-telescope/telescope.nvim' };
  { "chip/telescope-software-licenses.nvim" };
}
require('telescope').load_extension('telescope-software-licenses');
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use { "chip/telescope-software-licenses.nvim" }
require('telescope').load_extension('telescope-software-licenses')
```
## Setup

### Commands

```vim
" Prompts user for Github user/repo
" Prompts for file argument, but uses README.md as default
:Telescope telescope-software-licenses list
```

### Bind to Keys:

```vim
" Replace <Leader>cf with whatever you prefer
nnoremap <Leader>sl <cmd>Telescope telescope-software-licenses list
```

### Development

```zsh
$ git clone git@github.com:chip/telescope-software-licenses.nvim.git
$ cd telescope-software-licenses.nvim/lua/telescope/_extensions
$ nvim --cmd "set rtp+=$(pwd)" -u plugin/dev.vim
```
