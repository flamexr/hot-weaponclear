fx_version 'cerulean'
game 'gta5'

author 'Flame & Venüşş & HeySE'
description 'sql silah silme scripti'
version '1.0.0'

print("iyi eglenceler :)")

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'qb-core',
    'oxmysql'
} 