# DEV Updates to this repository

1. On my local machine, pull latest git commits from [spdx/license-list-data](https://github.com/spdx/license-list-data/blob/main/json/licenses.json):
    cd ~/code/license-list-data/
    pull
2. Copy latest json manifest from `spdx/license-list-data/json/licenses.json` to `json/` directory in this repo.
    cp json/licenses.json ~/code/neovim/plugins/telescope-software-licenses.nvim/json/
3. Copy license files from `spdx/license-list-data/text/*.txt` to `text/`
    cp text/* ~/code/neovim/plugins/telescope-software-licenses.nvim/text/
4. Update neovim config to test local plugin:
    v ~/.config/nvim/lua/plugins/init.lua
5. Test manually by launching vim
    :Telescope software_licnences find
6. Commit, tag release, push up to Github.
