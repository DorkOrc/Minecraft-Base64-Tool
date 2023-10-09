$execute unless data storage dork.base64.encode:storage section_encodes."$(chars)" run scoreboard players set .success dork.temp 0
execute if score .success dork.temp matches 0 run return 0

data modify storage dork.base64:temp args.encode.converted set value ""
$data modify storage dork.base64:temp args.encode.converted set from storage dork.base64.encode:storage section_encodes."$(char)"
