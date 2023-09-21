# arguments: terminator, include_terminator (bool)

$scoreboard players set .include_terminator base64.temp $(include_terminator)
$data modify storage base64:io decode.terminator set value "$(terminator)"
scoreboard players set .check_for_terminator base64.temp 1
execute if data storage base64:io decode.input run function base64:impl/decode/main

execute if score .success base64.temp matches 1 run return 1
return 0
