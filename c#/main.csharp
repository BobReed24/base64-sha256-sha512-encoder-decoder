using System;
using System.Text;
using System.Security.Cryptography;

class Program
{
    static string EncodeBase64(string inputStr)
    {
        byte[] bytes = Encoding.UTF8.GetBytes(inputStr);
        return Convert.ToBase64String(bytes);
    }

    static string DecodeBase64(string inputStr)
    {
        byte[] bytes = Convert.FromBase64String(inputStr);
        return Encoding.UTF8.GetString(bytes);
    }

    static string Sha256(string inputStr)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(inputStr));
            return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
        }
    }

    static string Sha512(string inputStr)
    {
        using (SHA512 sha512 = SHA512.Create())
        {
            byte[] hashBytes = sha512.ComputeHash(Encoding.UTF8.GetBytes(inputStr));
            return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
        }
    }

    static void Main()
    {
        Console.WriteLine("Choose an option: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512");
        string choice = Console.ReadLine();
        Console.WriteLine("Enter your message:");
        string inputStr = Console.ReadLine();

        switch (choice)
        {
            case "1":
                Console.WriteLine("Base64 Encoded: " + EncodeBase64(inputStr));
                break;
            case "2":
                Console.WriteLine("Base64 Decoded: " + DecodeBase64(inputStr));
                break;
            case "3":
                Console.WriteLine("SHA256 Hash: " + Sha256(inputStr));
                Console.WriteLine("This cannot be decrypted");
                break;
            case "4":
                Console.WriteLine("SHA512 Hash: " + Sha512(inputStr));
                Console.WriteLine("This cannot be decrypted");
                break;
            default:
                Console.WriteLine("Invalid choice");
                break;
        }
    }
}
