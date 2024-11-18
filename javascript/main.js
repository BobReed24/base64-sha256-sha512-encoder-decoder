const crypto = require('crypto');

function encodeBase64(inputStr) {
    return Buffer.from(inputStr).toString('base64');
}

function decodeBase64(inputStr) {
    return Buffer.from(inputStr, 'base64').toString('utf8');
}

function sha256(inputStr) {
    return crypto.createHash('sha256').update(inputStr).digest('hex');
}

function sha512(inputStr) {
    return crypto.createHash('sha512').update(inputStr).digest('hex');
}

const choice = prompt("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512");
const inputStr = prompt("Enter your message:");

if (choice === "1") {
    console.log("Base64 Encoded:", encodeBase64(inputStr));
} else if (choice === "2") {
    console.log("Base64 Decoded:", decodeBase64(inputStr));
} else if (choice === "3") {
    console.log("SHA256 Hash:", sha256(inputStr));
    console.log("This cannot be decrypted");
} else if (choice === "4") {
    console.log("SHA512 Hash:", sha512(inputStr));
    console.log("This cannot be decrypted");
} else {
    console.log("Invalid choice");
}
