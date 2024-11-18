defmodule EncoderDecoder do
  def base64_encode(message) do
    :base64.encode(message)
  end

  def base64_decode(encoded) do
    :base64.decode(encoded)
  end

  def sha256(message) do
    :crypto.hash(:sha256, message)
    |> Base.encode16()
  end

  def sha512(message) do
    :crypto.hash(:sha512, message)
    |> Base.encode16()
  end

  def run do
    IO.puts("Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512")
    choice = String.trim(IO.gets("Enter your choice: ")) |> String.to_integer()
    message = String.trim(IO.gets("Enter your message: "))

    case choice do
      1 -> IO.puts("Encoded Base64: #{base64_encode(message)}")
      2 -> IO.puts("Decoded Base64: #{base64_decode(message)}")
      3 -> IO.puts("SHA256: #{sha256(message)}") |> IO.puts("This cannot be decrypted.")
      4 -> IO.puts("SHA512: #{sha512(message)}") |> IO.puts("This cannot be decrypted.")
      _ -> IO.puts("Invalid choice.")
    end
  end
end

EncoderDecoder.run()
