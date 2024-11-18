use std::io::{self, Write};
use base64::{encode, decode};
use sha2::{Sha256, Sha512, Digest};

fn main() {
    println!("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512");
    let mut choice = String::new();
    io::stdin().read_line(&mut choice).unwrap();

    println!("Enter your message:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let input = input.trim();

    match choice.trim() {
        "1" => println!("Base64 Encoded: {}", encode(input)),
        "2" => match decode(input) {
            Ok(decoded) => println!("Base64 Decoded: {}", String::from_utf8_lossy(&decoded)),
            Err(_) => println!("Invalid Base64 input"),
        },
        "3" => {
            let mut hasher = Sha256::new();
            hasher.update(input);
            println!("SHA256 Hash: {:x}", hasher.finalize());
            println!("This cannot be decrypted");
        }
        "4" => {
            let mut hasher = Sha512::new();
            hasher.update(input);
            println!("SHA512 Hash: {:x}", hasher.finalize());
            println!("This cannot be decrypted");
        }
        _ => println!("Invalid choice"),
    }
}
