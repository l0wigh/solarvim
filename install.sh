#! /bin/bash

LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
mv ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua.bak
cp ./dashboard.lua ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua
mv ~/.config/lvim/config.lua ~/.config/lvim/config.lua.bak
cp ./config.lua  ~/.config/lvim/config.lua
