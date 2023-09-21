$data modify storage base64:temp args.decode.output set value "$(output)$(character)"

execute unless score .check_for_terminator base64.temp matches 1 run return 0
data modify storage base64:temp end set value ""
$data modify storage base64:temp end set string storage base64:temp args.decode.output -$(terminator_length)
execute store success score .different base64.temp run data modify storage base64:temp end set from storage base64:io decode.terminator
execute if score .different base64.temp matches 0 run scoreboard players set .index base64.temp -1
$execute if score .different base64.temp matches 0 if score .include_terminator base64.temp matches 0 run data modify storage base64:temp args.decode.output set string storage base64:temp args.decode.output 0 -$(terminator_length)
