import qualified Data.ByteString.Char8 as C
import qualified Crypto.Hash.SHA256 as SHA256
import qualified Crypto.Hash.SHA512 as SHA512
import qualified Data.ByteString.Base64 as B64

main :: IO ()
main = do
    putStrLn "Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512"
    choice <- getLine
    putStrLn "Enter your message:"
    input <- getLine
    let message = C.pack input

    case choice of
        "1" -> putStrLn $ "Encoded Base64: " ++ (C.unpack $ B64.encode message)
        "2" -> case B64.decode message of
                  Left _ -> putStrLn "Invalid Base64 input"
                  Right decoded -> putStrLn $ "Decoded Base64: " ++ (C.unpack decoded)
        "3" -> do
            let hash = SHA256.hash message
            putStrLn $ "SHA256: " ++ (show hash)
            putStrLn "This cannot be decrypted."
        "4" -> do
            let hash = SHA512.hash message
            putStrLn $ "SHA512: " ++ (show hash)
            putStrLn "This cannot be decrypted."
        _   -> putStrLn "Invalid choice."
