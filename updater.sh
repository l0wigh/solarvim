#! /bin/bash

echo "Updating SolarVim"
echo "-----------------"

mv ~/.config/lvim/config.lua ~/.config/lvim/_before_update_config.lua
mv ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua ~/.local/share/lunarvim/lvim/lua/lvim/core/_before_update_dashboard.lua

curl -o ~/.config/lvim/config.lua https://raw.githubusercontent.com/l0wigh/solarvim/master/config.lua
curl -o ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua https://raw.githubusercontent.com/l0wigh/solarvim/master/dashboard.lua

# svim +LvimUpdate +q
