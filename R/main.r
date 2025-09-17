encode_base64 <- function(message) {
  return(base64enc::base64encode(charToRaw(message)))
}

decode_base64 <- function(encoded) {
  return(rawToChar(base64enc::base64decode(encoded)))
}

hash_sha256 <- function(message) {
  return(openssl::sha256(message))
}

hash_sha512 <- function(message) {
  return(openssl::sha512(message))
}

message <- readline(prompt = "Enter your message: ")
cat("Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512\n")
choice <- suppressWarnings(as.integer(readline()))

if (is.na(choice)) {
  cat("Invalid input. Please enter a number 1–4.\n")
} else if (choice == 1) {
  print(paste("Encoded Base64:", encode_base64(message)))
} else if (choice == 2) {
  print(paste("Decoded Base64:", decode_base64(message)))
} else if (choice == 3) {
  print(paste("SHA256:", hash_sha256(message)))
  cat("This cannot be decrypted.\n")
} else if (choice == 4) {
  print(paste("SHA512:", hash_sha512(message)))
  cat("This cannot be decrypted.\n")
} else {
  cat("Invalid choice.\n")
}
