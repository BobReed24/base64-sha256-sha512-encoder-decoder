import * as crypto from 'crypto';

function encodeBase64(message: string): string {
    return Buffer.from(message).toString('base64');
}

function decodeBase64(encoded: string): string {
    return Buffer.from(encoded, 'base64').toString('utf-8');
}

function sha256(message: string): string {
    return crypto.createHash('sha256').update(message).digest('hex');
}

function sha512(message: string): string {
    return crypto.createHash('sha512').update(message).digest('hex');
}

const prompt = require('prompt-sync')();

const choice = parseInt(prompt('Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512: '));
const message = prompt('Enter your message: ');

switch (choice) {
    case 1:
        console.log(`Encoded Base64: ${encodeBase64(message)}`);
        break;
    case 2:
        console.log(`Decoded Base64: ${decodeBase64(message)}`);
        break;
    case 3:
        console.log(`SHA256: ${sha256(message)}`);
        console.log('This cannot be decrypted.');
        break;
    case 4:
        console.log(`SHA512: ${sha512(message)}`);
        console.log('This cannot be decrypted.');
        break;
    default:
        console.log('Invalid choice.');
}
