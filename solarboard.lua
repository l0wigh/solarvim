local utils = require "lvim.utils"
lvim.builtin.dashboard = {
  on_config_done = nil,
  search_handler = "telescope",
  disable_at_vim_enter = 0,
  session_directory = utils.join_paths(get_cache_dir(), "sessions"),
  custom_header = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    "███████╗ ██████╗ ██╗      █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "██╔════╝██╔═══██╗██║     ██╔══██╗██╔══██╗██║   ██║██║████╗ ████║",
    "███████╗██║   ██║██║     ███████║██████╔╝██║   ██║██║██╔████╔██║",
    "╚════██║██║   ██║██║     ██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║",
    "███████║╚██████╔╝███████╗██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "Version 1.4",
  },

  custom_section = {
    a = {
      description = { "  Find File          " },
      command = "Telescope find_files",
    },
    b = {
      description = { "  Recent Projects    " },
      command = "Telescope projects",
    },
    c = {
      description = { "  Recently Used Files" },
      command = "Telescope oldfiles",
    },
    d = {
      description = { "  Find Word          " },
      command = "Telescope live_grep",
    },
    e = {
      description = { "  Configuration      " },
      command = ":e ~/.config/lvim/config.lua",
    },
  },

  footer = { "lunarvim.org" },
  }
