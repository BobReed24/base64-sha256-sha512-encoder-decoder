package main

import (
	"crypto/sha256"
	"crypto/sha512"
	"encoding/base64"
	"fmt"
)

func encodeBase64(inputStr string) string {
	return base64.StdEncoding.EncodeToString([]byte(inputStr))
}

func decodeBase64(inputStr string) (string, error) {
	decoded, err := base64.StdEncoding.DecodeString(inputStr)
	if err != nil {
		return "", err
	}
	return string(decoded), nil
}

func sha256Hash(inputStr string) string {
	hash := sha256.Sum256([]byte(inputStr))
	return fmt.Sprintf("%x", hash)
}

func sha512Hash(inputStr string) string {
	hash := sha512.Sum512([]byte(inputStr))
	return fmt.Sprintf("%x", hash)
}

func main() {
	var choice string
	fmt.Println("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512")
	fmt.Scanln(&choice)
	fmt.Println("Enter your message:")
	var inputStr string
	fmt.Scanln(&inputStr)

	switch choice {
	case "1":
		fmt.Println("Base64 Encoded:", encodeBase64(inputStr))
	case "2":
		decoded, err := decodeBase64(inputStr)
		if err != nil {
			fmt.Println("Error decoding Base64:", err)
		} else {
			fmt.Println("Base64 Decoded:", decoded)
		}
	case "3":
		fmt.Println("SHA256 Hash:", sha256Hash(inputStr))
		fmt.Println("This cannot be decrypted")
	case "4":
		fmt.Println("SHA512 Hash:", sha512Hash(inputStr))
		fmt.Println("This cannot be decrypted")
	default:
		fmt.Println("Invalid choice")
	}
}
