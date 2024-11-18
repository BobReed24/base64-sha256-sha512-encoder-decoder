#include <iostream>
#include <string>
#include <openssl/sha.h>
#include <openssl/bio.h>
#include <openssl/evp.h>
#include <openssl/buffer.h>

std::string base64_encode(const std::string& input) {
    BIO* bio = BIO_new(BIO_f_base64());
    BIO* mem = BIO_new(BIO_s_mem());
    bio = BIO_push(bio, mem);
    BIO_write(bio, input.data(), input.size());
    BIO_flush(bio);
    BUF_MEM* buffer;
    BIO_get_mem_ptr(bio, &buffer);
    std::string output(buffer->data, buffer->length);
    BIO_free_all(bio);
    return output;
}

std::string base64_decode(const std::string& input) {
    BIO* bio = BIO_new_mem_buf(input.data(), input.size());
    BIO* b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);
    char buffer[input.size()];
    int decoded_size = BIO_read(bio, buffer, input.size());
    BIO_free_all(bio);
    return std::string(buffer, decoded_size);
}

std::string sha256(const std::string& input) {
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)input.data(), input.size(), hash);
    return std::string(reinterpret_cast<char*>(hash), SHA256_DIGEST_LENGTH);
}

std::string sha512(const std::string& input) {
    unsigned char hash[SHA512_DIGEST_LENGTH];
    SHA512((unsigned char*)input.data(), input.size(), hash);
    return std::string(reinterpret_cast<char*>(hash), SHA512_DIGEST_LENGTH);
}

int main() {
    std::cout << "Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512\n";
    int choice;
    std::cin >> choice;
    std::cin.ignore();
    std::cout << "Enter your message:\n";
    std::string input;
    std::getline(std::cin, input);

    switch (choice) {
        case 1: std::cout << "Base64 Encoded: " << base64_encode(input) << "\n"; break;
        case 2: std::cout << "Base64 Decoded: " << base64_decode(input) << "\n"; break;
        case 3: std::cout << "SHA256 Hash: " << sha256(input) << "\nThis cannot be decrypted\n"; break;
        case 4: std::cout << "SHA512 Hash: " << sha512(input) << "\nThis cannot be decrypted\n"; break;
        default: std::cout << "Invalid choice\n"; break;
    }
    return 0;
}
