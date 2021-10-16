#! /bin/bash

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
echo "----------------"
echo "Installing SolarVim"
mv ~/.config/lvim/config.lua ~/.config/lvim/config.lua.bak
cp ./config.lua  ~/.config/lvim/config.lua
mkdir ~/.config/lvim/lua
cp ./solarboard.lua ~/.config/lvim/lua/
mv ~/.local/bin/lvim ~/.local/bin/svim
mkdir ~/.config/lvim/undodir
svim +PackerUpdate
