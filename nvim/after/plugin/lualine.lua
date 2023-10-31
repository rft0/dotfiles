local custom_gruvbox = require'lualine.themes.gruvbox'

custom_gruvbox.normal.c.bg = ''
custom_gruvbox.visual.c.bg = ''
custom_gruvbox.command.c.bg = ''
custom_gruvbox.insert.c.bg = ''
custom_gruvbox.replace.c.bg = ''

require('lualine').setup {
  options = {
      theme  = custom_gruvbox,
      icons_enabled = false,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
  },  
}
