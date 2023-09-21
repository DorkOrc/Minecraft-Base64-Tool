data modify storage base64:temp args.decode.binary set string storage base64:temp args.decode.binary 8
data modify storage base64:temp args.decode.character set value ""
$data modify storage base64:temp args.decode.character set from storage base64:global binary_to_ascii."$(byte)"

data modify entity @s text set value '{"storage":"base64:temp","nbt":"args.decode.output"}'
data modify storage base64:temp args.decode.output set string entity @s text 9 -2
function base64:impl/decode/concatenate with storage base64:temp args.decode
