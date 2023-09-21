scoreboard players set .check_for_terminator base64.temp 0
execute if data storage base64:io decode.input run function base64:impl/decode/main

execute if score .success base64.temp matches 1 run return 1
return 0
