#!  /bin/bash

echo "Uninstalling SolarVim..."
echo "------------------------"

# removing SolvarVim dashboard
rm ~/.config/lvim/lua/solarboard.lua
rm ~/.config/lvim/lua/_before_update_solarboard.lua

# removing SolvarVim Config
rm ~/.config/lvim/config.lua
rm ~/.config/lvim/_before_update_config.lua
mv ~/.config/lvim/config.lua.bak ~/.config/lvim/config.lua

# switching svim to lvim
mv ~/.local/bin/svim ~/.local/bin/lvim

# force update to default config
lvim +LvimUpdate +PackerSync
