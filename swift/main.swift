import Foundation
import CommonCrypto

func encodeBase64(inputStr: String) -> String {
    let data = inputStr.data(using: .utf8)!
    return data.base64EncodedString()
}

func decodeBase64(inputStr: String) -> String {
    if let data = Data(base64Encoded: inputStr) {
        return String(data: data, encoding: .utf8) ?? "Invalid Base64"
    } else {
        return "Invalid Base64"
    }
}

func sha256(inputStr: String) -> String {
    let data = inputStr.data(using: .utf8)!
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
    }
    return hash.map { String(format: "%02x", $0) }.joined()
}

func sha512(inputStr: String) -> String {
    let data = inputStr.data(using: .utf8)!
    var hash = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_SHA512($0.baseAddress, CC_LONG(data.count), &hash)
    }
    return hash.map { String(format: "%02x", $0) }.joined()
}

print("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512")
let choice = readLine()!
print("Enter your message:")
let inputStr = readLine()!

switch choice {
case "1":
    print("Base64 Encoded:", encodeBase64(inputStr: inputStr!))
case "2":
    print("Base64 Decoded:", decodeBase64(inputStr: inputStr!))
case "3":
    print("SHA256 Hash:", sha256(inputStr: inputStr!))
    print("This cannot be decrypted")
case "4":
    print("SHA512 Hash:", sha512(inputStr: inputStr!))
    print("This cannot be decrypted")
default:
    print("Invalid choice")
}
