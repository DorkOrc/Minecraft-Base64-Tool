$execute unless data storage base64:global digit_to_binary."$(char)" run scoreboard players set .success base64.temp 0
execute if score .success base64.temp matches 0 run return 0

data modify storage base64:temp args.decode.converted set value ""
$data modify storage base64:temp args.decode.converted set from storage base64:global digit_to_binary."$(char)"
function base64:impl/decode/try_convert with storage base64:temp args.decode

# repeat
data modify storage base64:temp args.decode.char set string storage base64:io decode.input 0 1
data modify storage base64:io decode.input set string storage base64:io decode.input 1
scoreboard players add .index base64.temp 1
execute if score .index base64.temp < .length base64.temp run function base64:impl/decode/loop with storage base64:temp args.decode
