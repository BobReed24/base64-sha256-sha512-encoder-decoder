require 'base64'
require 'openssl'

def encode_base64(input_str)
  Base64.encode64(input_str)
end

def decode_base64(input_str)
  Base64.decode64(input_str)
end

def sha256(input_str)
  OpenSSL::Digest::SHA256.hexdigest(input_str)
end

def sha512(input_str)
  OpenSSL::Digest::SHA512.hexdigest(input_str)
end

puts "Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512"
choice = gets.chomp
puts "Enter your message:"
input_str = gets.chomp

case choice
when "1"
  puts "Base64 Encoded: #{encode_base64(input_str)}"
when "2"
  puts "Base64 Decoded: #{decode_base64(input_str)}"
when "3"
  puts "SHA256 Hash: #{sha256(input_str)}"
  puts "This cannot be decrypted"
when "4"
  puts "SHA512 Hash: #{sha512(input_str)}"
  puts "This cannot be decrypted"
else
  puts "Invalid choice"
end
