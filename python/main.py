import base64
import hashlib

def encode_base64(input_str):
    return base64.b64encode(input_str.encode()).decode()

def decode_base64(input_str):
    return base64.b64decode(input_str).decode()

def sha256(input_str):
    return hashlib.sha256(input_str.encode()).hexdigest()

def sha512(input_str):
    return hashlib.sha512(input_str.encode()).hexdigest()

choice = input("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512: ")
input_str = input("Enter your message: ")

if choice == "1":
    print("Base64 Encoded:", encode_base64(input_str))
elif choice == "2":
    print("Base64 Decoded:", decode_base64(input_str))
elif choice == "3":
    print("SHA256 Hash:", sha256(input_str))
    print("This cannot be decrypted")
elif choice == "4":
    print("SHA512 Hash:", sha512(input_str))
    print("This cannot be decrypted")
else:
    print("Invalid choice")
