# arguments: source

$data modify storage base64:io decode.input set from $(source) 
scoreboard players set .check_for_terminator base64.temp 0
function base64:impl/decode/main

execute if score .success base64.temp matches 1 run return 1
return 0
