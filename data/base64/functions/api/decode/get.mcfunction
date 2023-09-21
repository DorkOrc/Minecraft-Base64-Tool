# arguments: input

$data modify storage base64:io decode.input set value "$(input)" 
scoreboard players set .check_for_terminator base64.temp 0
function base64:impl/decode/main

$execute if score .success base64.temp matches 1 run tellraw @s ["Decoded '",{"text":"$(input)","color":"aqua"},"' to '",{"storage":"base64:io","nbt":"decode.output","color":"green"},"'"]
execute if score .success base64.temp matches 1 run return 1

execute store result score .start_index base64.temp store result score .end_index base64.temp run scoreboard players get .index base64.temp
execute store result storage base64:temp args.decode.end_index int 1 run scoreboard players add .end_index base64.temp 1
scoreboard players remove .start_index base64.temp 10
execute if score .start_index base64.temp matches ..-1 run scoreboard players set .start_index base64.temp 0
execute store result storage base64:temp args.decode.start_index int 1 run scoreboard players get .start_index base64.temp

$data modify storage base64:io decode.input set value "$(input)"
function base64:impl/decode/get_error_message with storage base64:temp args.decode
execute if score .start_index base64.temp matches 0 run tellraw @s [{"text":"Invalid character at position ","color":"red"},{"score":{"name":".index","objective":"base64.temp"}},": ",{"storage":"base64:temp","nbt":"section"},"<--[HERE]"]
execute if score .start_index base64.temp matches 1.. run tellraw @s [{"text":"Invalid character at position ","color":"red"},{"score":{"name":".index","objective":"base64.temp"}},": ...",{"storage":"base64:temp","nbt":"section"},"<--[HERE]"]

return 0
