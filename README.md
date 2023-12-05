
# Minecraft-Base64-Tool
A data pack for Minecraft 1.20.2+ that provides an API for converting a Base64 encoded string of ASCII characters back into its ASCII form. This will be particularly useful for reading the texture properties data in player heads which gives you access to the system time as a Unix Timestamp. The pack may be extended to allow for encoding to base64 in the future. 

## How to Use
There are a few options for inputting data into the converter. The output of all the functions will always be at `storage dork.base64:io decode.output` or `storage dork.base64:io encode.output`. All the functions will return 1 if they successfully decoded / encoded the string, and 0 if an error occurred.

### encode
This will just encode the string entered into the function.
```
function dork.base64:api/encode {input:"Hello World"}
```
### encode/get
To simply see the converted result in chat, you can use `/function dork.base64:api/encode/get`. Running this from chat will give you the result of the encoded string with the ability to copy the output, or if the string is not a valid alpha-numeric (with puncuation) characters, an error will print out.
```
/function dork.base64:api/encode/get {input:"hello world"}
```
![Preview](https://cdn.discordapp.com/attachments/1154232908123475968/1176488921111220234/image.png)

### decode
This will just decode the string entered into the function.
```
function dork.base64:api/decode {input:"aGVsbG8gd29ybGQ="}
```
### decode/get
To simply see the converted result in chat, you can use `/function dork.base64:api/decode/get`. Running this from chat will give you the result of the conversion or, if the string is not a valid base 64 encoded string, it will tell you where the error is.
```
function dork.base64:api/decode/get {input:"aGVsbG8gd29ybGQ="}
function dork.base64:api/decode/get {input:"aGV£sbG8gd29ybGQ="}
```
![Preview](https://media.discordapp.net/attachments/380394321217716227/1154220903706669147/image.png?width=877&height=136)
### decode/direct
This will decode the contents of `storage dork.base64:io decode.input`.
```
data modify storage dork.base64:io decode.input set value "aGVsbG8gd29ybGQ="
function dork.base64:api/decode/direct
```

### decode/from
This will decode the contents of the source you enter into the function.
```
function dork.base64:api/decode/from {source:"entity @s SelectedItem.tag.SkullOwner.Properties.textures[0].Value"}
```
### decode/until
This will decode the contents of `storage dork.base64:io decode.input` up until the decoded output matches the `terminator` you enter into the function. You must also specify whether the terminator itself will be included in the output string or not
```
data modify storage dork.base64:io decode.input set value "eyJmb28iOiAxLCAiYmFyIjogMn0="
function dork.base64:api/decode/until {terminator: ",", include_terminator: true}
# --> {"foo": 1,
```
## Getting the Current Unix Timestamp
You can use this API to get the system time in the form of a "Unix Timestamp" or "Unix Epoch Timestamp" which is the number of seconds (or milliseconds) since midnight UTC on the 1st January 1970. 
First you must generate a player head which contains this information. You can use a loot table (which requires an online player) or you can run `/setblock <pos> player_head{SkullOwner:{Name:"<username>"}}`.
From there you can copy the relevant base64-encoded string at path `SkullOwner.Properties.textures[0].Value` in the item or block to `storage dork.base64:io decode.input`, and run the following command:
```
function dork.base64:api/decode/until {terminator: ",", include_terminator: false}
```
Since the encoded JSON is always generated in the same form, the timestamp will always be the number just before the first comma in the string. From here, you can convert the JSON to NBT using a macro function, and from there you can store the timstamp to wherever you need.
**Note**: the timestamp stored in the JSON is the number of _milliseconds_ since the Unix Epoch, so the value is larger than an integer so would get stored as a `long` in NBT and overflows as a score. However, you can use `/data modify ... set string ... <min> <max>` to cut off the last 3 digits which effectively divides it by 1000, converting it to seconds.
## Limitations

- This heavily uses the new "macro" features in Minecraft 1.20.2, so will not work in any prior version.

### Encoding
- Due to size limitations, the encoding array is stored inside an item in an armor stand within a structure. This structure is used only during load / reload of this datapack. The armorstand is instantly killed off once the encoding array is placed into stroage preventing any chunk-corruption issues. Due to this, the datapack will need at least 1GB of RAM to load the datapack correctly.
- If the input string contains any characters other than below (space included) the function will return `0`: 
```
0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz /@_~^!#{:}$%&'()|*+,-.;<=>?["\]
```


### Decoding
- This currently only decodes ASCII characters so, despite reading 8 bits for each character, extended ASCII characters will be ignored.
- Characters with an encoding value less than 32 will be ignored. This includes newlines and horizontal tabs.
- If the length of the underlying binary value is not divisible by 8, any left over digits will be ignored.
- If the input string contains any characters other than `A-Z`, `a-z`, `0-9`, `+`, `/`, or `=`, there will be no outputted value, and `decode/get` will print an error message showing you the position of the illegal character. 

## Supported Versions
- Releases:
  - `1.20.2`
  - `1.20.3`
- Pack formats (snapshots):
  - `18` (`1.20.2-pre1`-`1.20.2`)
  - `19` (`23w40a`-`23w46a`)
  - `26` (`1.20.3-pre1`-)
