# (storage base64:io decode.input)

scoreboard players set .success base64.temp 1
execute store result score .length base64.temp run data get storage base64:io decode.input
scoreboard players set .index base64.temp 0

data modify storage base64:temp args.decode set value {output:"",binary:"","converted":"",terminator_length:1}
execute if score .check_for_terminator base64.temp matches 1 store result storage base64:temp args.decode.terminator_length int 1 run data get storage base64:io decode.terminator
data modify storage base64:temp args.decode.char set string storage base64:io decode.input 0 1
data modify storage base64:io decode.input set string storage base64:io decode.input 1
execute if score .index base64.temp < .length base64.temp positioned ~ -2000 ~ summon text_display run function base64:impl/decode/init_entity

execute if score .success base64.temp matches 1 run data modify storage base64:io decode.output set from storage base64:temp args.decode.output
execute if score .success base64.temp matches 0 run data remove storage base64:io decode.output
