game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
ui_page 'html/ui.html'


files{
  'html/ui.html',
  'html/css/contextMenu.min.css',
  'html/css/jquery.dialog.min.css',
  'html/css/ui.min.css',
  'html/js/config.js',
  'html/js/contextMenu.min.js',
  'html/js/jquery.dialog.min.js',
  'html/fonts/crock.ttf',
  'html/img/bgPanel.png',
  'html/img/bg.png',
  'html/img/bgitem.png',
  'html/webfonts/*',
  'html/webfonts/**',
  'html/css/all.css',
  'html/css/all.min.css',
  -- ICONS
  'html/img/items/*.png',
  'html/img/items/*.jpg',
  'html/img/items/*.png',
}


client_scripts{
  'client/handler/*.lua',
  'client/*.lua',
}
server_scripts {
  'server/handler/*.lua',
  'server/*.lua',
}

shared_scripts {
  "config.lua",
}
server_exports{'vorp_inventoryApi'} 