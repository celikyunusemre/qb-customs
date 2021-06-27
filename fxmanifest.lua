fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/ui.js',
    'html/imgs/logo.png',
    'html/sounds/wrench.ogg',
    'html/sounds/respray.ogg'
}

client_scripts {
    'config.lua',
    'client/cl_ui.lua',
    'client/cl_bennys.lua'
}

server_scripts {
    'config.lua',
    'server/sv_bennys.lua'
}