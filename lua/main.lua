local mime = require("mime")

print("Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512")
local choice = io.read()

print("Enter your message:")
local input = io.read()

if choice == "1" then
    local encoded = mime.encode("base64", input)
    print("Encoded Base64: " .. encoded)
elseif choice == "2" then
    local decoded, err = mime.decode("base64", input)
    if err then
        print("Invalid Base64 input")
    else
        print("Decoded Base64: " .. decoded)
    end
elseif choice == "3" then
    local sha256 = require("sha2")
    local hash = sha256(input)
    print("SHA256: " .. hash)
    print("This cannot be decrypted.")
elseif choice == "4" then
    local sha512 = require("sha2")
    local hash = sha512(input)
    print("SHA512: " .. hash)
    print("This cannot be decrypted.")
else
    print("Invalid choice.")
end
