<?php

function encodeBase64($inputStr) {
    return base64_encode($inputStr);
}

function decodeBase64($inputStr) {
    return base64_decode($inputStr);
}

function sha256($inputStr) {
    return hash('sha256', $inputStr);
}

function sha512($inputStr) {
    return hash('sha512', $inputStr);
}

echo "Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512\n";
$choice = trim(fgets(STDIN));

echo "Enter your message:\n";
$inputStr = trim(fgets(STDIN));

switch ($choice) {
    case "1":
        echo "Base64 Encoded: " . encodeBase64($inputStr) . "\n";
        break;
    case "2":
        echo "Base64 Decoded: " . decodeBase64($inputStr) . "\n";
        break;
    case "3":
        echo "SHA256 Hash: " . sha256($inputStr) . "\n";
        echo "This cannot be decrypted\n";
        break;
    case "4":
        echo "SHA512 Hash: " . sha512($inputStr) . "\n";
        echo "This cannot be decrypted\n";
        break;
    default:
        echo "Invalid choice\n";
        break;
}
?>
