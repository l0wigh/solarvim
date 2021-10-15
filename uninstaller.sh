#!  /bin/bash

echo "Uninstalling SolarVim..."
echo "------------------------"

# removing SolvarVim dashboard
rm ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua
mv ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua.bak ~/.local/share/lunarvim/lvim/lua/lvim/core/dashboard.lua

# removing SolvarVim Config
rm ~/.config/lvim/config.lua
mv ~/.config/lvim/config.lua.bak ~/.config/lvim/config.lua

# switching svim to lvim
mv ~/.local/bin/svim ~/.local/bin/lvim

# force update to default config
lvim +LvimUpdate +PackerSync
