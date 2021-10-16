#! /bin/bash

echo "Updating SolarVim"
echo "-----------------"

rm ~/.config/lvim/_before_update_config.lua
rm ~/.config/lvim/lua/_before_update_solarboard.lua
mv ~/.config/lvim/config.lua ~/.config/lvim/_before_update_config.lua
mv ~/.config/lvim/lua/solarboard.lua ~/.config/lvim/lua/_before_update_solarboard.lua

cd ~/.config/lvim/ && { curl -O https://raw.githubusercontent.com/l0wigh/solarvim/master/config.lua ; cd ~; }
cd ~/.config/lvim/lua/ && { curl -O https://raw.githubusercontent.com/l0wigh/solarvim/master/solarboard.lua; cd ~; }

svim +PackerUpdate
