#include <stdio.h>
#include <string.h>
#include <openssl/sha.h>
#include <openssl/bio.h>
#include <openssl/evp.h>
#include <openssl/buffer.h>

void base64_encode(const char* input, char* output) {
    BIO* bio = BIO_new(BIO_f_base64());
    BIO* mem = BIO_new(BIO_s_mem());
    bio = BIO_push(bio, mem);
    BIO_write(bio, input, strlen(input));
    BIO_flush(bio);
    BUF_MEM* buffer;
    BIO_get_mem_ptr(bio, &buffer);
    memcpy(output, buffer->data, buffer->length);
    BIO_free_all(bio);
}

void base64_decode(const char* input, char* output) {
    BIO* bio = BIO_new_mem_buf(input, -1);
    BIO* b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);
    BIO_read(bio, output, strlen(input));
    BIO_free_all(bio);
}

void sha256(const char* input, char* output) {
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)input, strlen(input), hash);
    memcpy(output, hash, SHA256_DIGEST_LENGTH);
}

void sha512(const char* input, char* output) {
    unsigned char hash[SHA512_DIGEST_LENGTH];
    SHA512((unsigned char*)input, strlen(input), hash);
    memcpy(output, hash, SHA512_DIGEST_LENGTH);
}

int main() {
    printf("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512\n");
    int choice;
    scanf("%d", &choice);
    getchar();
    printf("Enter your message:\n");
    char input[1024];
    fgets(input, 1024, stdin);
    input[strcspn(input, "\n")] = 0;

    char output[1024];
    switch (choice) {
        case 1: base64_encode(input, output); printf("Base64 Encoded: %s\n", output); break;
        case 2: base64_decode(input, output); printf("Base64 Decoded: %s\n", output); break;
        case 3: sha256(input, output); printf("SHA256 Hash: %s\nThis cannot be decrypted\n", output); break;
        case 4: sha512(input, output); printf("SHA512 Hash: %s\nThis cannot be decrypted\n", output); break;
        default: printf("Invalid choice\n"); break;
    }
    return 0;
}
