version '1.0.0'
description 'Advanced Roleplay Framework for FiveM'
author '0xLuca'

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'src/client/**/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'src/server/**/*.lua'
}

shared_scripts {
    'src/shared/**/*.lua'
}

exports {

}

server_exports {

}