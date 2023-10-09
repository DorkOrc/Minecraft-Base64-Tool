scoreboard objectives add dork.temp dummy

data modify storage dork.base64:global digit_to_binary set value {"A": "000000", "B": "000001", "C": "000010", "D": "000011", "E": "000100", "F": "000101", "G": "000110", "H": "000111", "I": "001000", "J": "001001", "K": "001010", "L": "001011", "M": "001100", "N": "001101", "O": "001110", "P": "001111", "Q": "010000", "R": "010001", "S": "010010", "T": "010011", "U": "010100", "V": "010101", "W": "010110", "X": "010111", "Y": "011000", "Z": "011001", "a": "011010", "b": "011011", "c": "011100", "d": "011101", "e": "011110", "f": "011111", "g": "100000", "h": "100001", "i": "100010", "j": "100011", "k": "100100", "l": "100101", "m": "100110", "n": "100111", "o": "101000", "p": "101001", "q": "101010", "r": "101011", "s": "101100", "t": "101101", "u": "101110", "v": "101111", "w": "110000", "x": "110001", "y": "110010", "z": "110011", "0": "110100", "1": "110101", "2": "110110", "3": "110111", "4": "111000", "5": "111001", "6": "111010", "7": "111011", "8": "111100", "9": "111101", "+": "111110", "/": "111111", "=": ""}
data modify storage dork.base64:global binary_to_ascii set value {"00100000": " ", "00100001": "!", "00100010": "\\\"", "00100011": "#", "00100100": "$", "00100101": "%", "00100110": "&", "00100111": "'", "00101000": "(", "00101001": ")", "00101010": "*", "00101011": "+", "00101100": ",", "00101101": "-", "00101110": ".", "00101111": "/", "00110000": "0", "00110001": "1", "00110010": "2", "00110011": "3", "00110100": "4", "00110101": "5", "00110110": "6", "00110111": "7", "00111000": "8", "00111001": "9", "00111010": ":", "00111011": ";", "00111100": "<", "00111101": "=", "00111110": ">", "00111111": "?", "01000000": "@", "01000001": "A", "01000010": "B", "01000011": "C", "01000100": "D", "01000101": "E", "01000110": "F", "01000111": "G", "01001000": "H", "01001001": "I", "01001010": "J", "01001011": "K", "01001100": "L", "01001101": "M", "01001110": "N", "01001111": "O", "01010000": "P", "01010001": "Q", "01010010": "R", "01010011": "S", "01010100": "T", "01010101": "U", "01010110": "V", "01010111": "W", "01011000": "X", "01011001": "Y", "01011010": "Z", "01011011": "[", "01011100": "\\\\", "01011101": "]", "01011110": "^", "01011111": "_", "01100000": "`", "01100001": "a", "01100010": "b", "01100011": "c", "01100100": "d", "01100101": "e", "01100110": "f", "01100111": "g", "01101000": "h", "01101001": "i", "01101010": "j", "01101011": "k", "01101100": "l", "01101101": "m", "01101110": "n", "01101111": "o", "01110000": "p", "01110001": "q", "01110010": "r", "01110011": "s", "01110100": "t", "01110101": "u", "01110110": "v", "01110111": "w", "01111000": "x", "01111001": "y", "01111010": "z", "01111011": "{", "01111100": "|", "01111101": "}", "01111110": "~"}
# Although the mcfunction file is nearly 2mb, the resulting .dat file is only 700kb
function dork.base64:impl/encode/load_chars