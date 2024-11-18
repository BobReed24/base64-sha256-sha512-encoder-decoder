document.getElementById('base64EncodeBtn').addEventListener('click', () => {
    const input = document.getElementById('inputMessage').value;
    const encoded = btoa(input);
    document.getElementById('output').value = encoded;
});

document.getElementById('base64DecodeBtn').addEventListener('click', () => {
    const input = document.getElementById('inputMessage').value;
    try {
        const decoded = atob(input);
        document.getElementById('output').value = decoded;
    } catch (e) {
        document.getElementById('output').value = 'Invalid Base64 input';
    }
});

document.getElementById('sha256Btn').addEventListener('click', async () => {
    const input = document.getElementById('inputMessage').value;
    const hashBuffer = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(input));
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
    document.getElementById('output').value = hashHex;
    document.getElementById('output').value += '\nThis cannot be decrypted.';
});

document.getElementById('sha512Btn').addEventListener('click', async () => {
    const input = document.getElementById('inputMessage').value;
    const hashBuffer = await crypto.subtle.digest('SHA-512', new TextEncoder().encode(input));
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
    document.getElementById('output').value = hashHex;
    document.getElementById('output').value += '\nThis cannot be decrypted.';
});
