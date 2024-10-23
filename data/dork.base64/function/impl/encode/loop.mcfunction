$execute unless data storage dork.base64.encode:storage section_encodes."$(char1)$(char2)$(char3)" run scoreboard players set .success dork.temp 0
execute if score .success dork.temp matches 0 run return 0

data modify storage dork.base64:temp args.encode.converted set value ""
$data modify storage dork.base64:temp args.encode.converted set from storage dork.base64.encode:storage section_encodes."$(char1)$(char2)$(char3)"
function dork.base64:impl/encode/concatenate with storage dork.base64:temp args.encode

data modify storage dork.base64:temp args.encode.converting set string storage dork.base64:temp args.encode.converting 3
scoreboard players remove .chars_remaining dork.temp 3
scoreboard players add .index dork.temp 3

data modify storage dork.base64:temp args.encode merge value {char1:"",char2:"",char3:""}
execute if score .length dork.temp matches 1.. run data modify storage dork.base64:temp args.encode.char1 set string storage dork.base64:temp args.encode.converting 0 1
execute if score .length dork.temp matches 1.. if data storage dork.base64:temp args.encode{char1:'"'} run data modify storage dork.base64:temp args.encode.char1 set value '\\"'
execute if score .length dork.temp matches 1.. if data storage dork.base64:temp args.encode{char1:'\\'} run data modify storage dork.base64:temp args.encode.char1 set value '\\\\'
execute if score .length dork.temp matches 2.. run data modify storage dork.base64:temp args.encode.char2 set string storage dork.base64:temp args.encode.converting 1 2
execute if score .length dork.temp matches 2.. if data storage dork.base64:temp args.encode{char2:'"'} run data modify storage dork.base64:temp args.encode.char2 set value '\\"'
execute if score .length dork.temp matches 2.. if data storage dork.base64:temp args.encode{char2:'\\'} run data modify storage dork.base64:temp args.encode.char2 set value '\\\\'
execute if score .length dork.temp matches 3.. run data modify storage dork.base64:temp args.encode.char3 set string storage dork.base64:temp args.encode.converting 2 3
execute if score .length dork.temp matches 3.. if data storage dork.base64:temp args.encode{char3:'"'} run data modify storage dork.base64:temp args.encode.char3 set value '\\"'
execute if score .length dork.temp matches 3.. if data storage dork.base64:temp args.encode{char3:'\\'} run data modify storage dork.base64:temp args.encode.char3 set value '\\\\'

execute if score .index dork.temp < .length dork.temp run function dork.base64:impl/encode/loop with storage dork.base64:temp args.encode