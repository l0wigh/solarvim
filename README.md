# SolarVim

Custom config for LunarVim

# KEEP IN MIND THAT INSTALLING SolarVim WILL ERASE YOUR LunarVim SETUP
You can probably recover it since I'm creating backups of files that I change, but don't take any risk

Just try it in VM or anything like that.

# How to use
## Install
```shell
git clone https://github.com/l0wigh/solarvim/
cd solarvim
chmod +x install.sh
./install.sh
```

No need to install LunarVim by yourself

Just use my installer

Do the LunarVim initial setup and pray for the SolarVim installation to work

If it worked it should start svim and update packages to add my plugins

Keep in mind that only some \"non-important\" part of LunarVim are modified

Most of it will still use the lvim nomination

Only the executable will be svim and not lvim

## Uninstall
```shell
chmod +x uninstaller.sh
./uninstaller.sh
```

Will put lunarvim to it previous (or stock) installation

# What's different ?

So I needed a fast setup that I can pretty much install in some minutes

LunarVim was great but I needed some more customisations :
  * hjkl is now jklm (better for french keyboards)
  * custom which-key setup for adding more stuff without conflict (using more sub menu)
  * custom general vim setup that I like : undodir, noswap, tab, relativenumber
  * and maybe other changes that I don't have in mind

The code might not be great to look at but it work for me

It's not an usual way to configure vim. It's mostly optimised for my workflow and my liking.

Just don't use that without testing it before




