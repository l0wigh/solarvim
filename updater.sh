#! /bin/bash

echo "Updating SolarVim"
echo "-----------------"

mv ~/.config/lvim/config.lua ~/.config/lvim/_before_update_config.lua
mv ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua ~/.local/share/lunarvim/lvim/lua/lvim/core/_before_update_dashboard.lua

cd ~/.config/lvim/ && { curl -O https://raw.githubusercontent.com/l0wigh/solarvim/master/config.lua ; cd ~; }
cd ~/.local/share/lunarvim/lvim/lua/lvim/core/ && { curl -O https://raw.githubusercontent.com/l0wigh/solarvim/master/dashboard.lua; cd ~; }

# svim +LvimUpdate +q
