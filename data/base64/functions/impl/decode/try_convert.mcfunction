$data modify storage base64:temp args.decode.binary set value "$(binary)$(converted)"
data modify storage base64:temp args.decode.byte set value ""
data modify storage base64:temp args.decode.byte set string storage base64:temp args.decode.binary 0 8
execute unless data storage base64:temp args.decode{byte:""} run function base64:impl/decode/do_convert with storage base64:temp args.decode
