description 'RedEM:RP Dialog'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
   'config.lua',
   'client/client.lua',
   'client/cl_quest.lua',
   'html/ui.html',
   'html/style.css',
   'html/crock.ttf'
}

server_scripts {
   'config.lua',
   'server/sv_dialog.lua',
   'server/sv_main.lua',
   'server/sv_quest.lua'
}

files{
	'html/ui.html',
	'html/style.css',
	'html/crock.ttf',
}

ui_page 'html/ui.html'