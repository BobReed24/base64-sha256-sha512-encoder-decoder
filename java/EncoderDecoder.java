import java.util.Base64;
import java.security.MessageDigest;

public class EncoderDecoder {
    public static String encodeBase64(String inputStr) {
        return Base64.getEncoder().encodeToString(inputStr.getBytes());
    }

    public static String decodeBase64(String inputStr) {
        byte[] decodedBytes = Base64.getDecoder().decode(inputStr);
        return new String(decodedBytes);
    }

    public static String sha256(String inputStr) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(inputStr.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(Integer.toHexString(0xFF & b));
        }
        return hexString.toString();
    }

    public static String sha512(String inputStr) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-512");
        byte[] hash = digest.digest(inputStr.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(Integer.toHexString(0xFF & b));
        }
        return hexString.toString();
    }

    public static void main(String[] args) throws Exception {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        System.out.println("Choose an option:\n 1) Base64 Encode \n2) Base64 Decode \n3) SHA256 \n4) SHA512");
        String choice = scanner.nextLine();
        System.out.println("Enter your message:");
        String inputStr = scanner.nextLine();

        if (choice.equals("1")) {
            System.out.println("Base64 Encoded: " + encodeBase64(inputStr));
        } else if (choice.equals("2")) {
            System.out.println("Base64 Decoded: " + decodeBase64(inputStr));
        } else if (choice.equals("3")) {
            System.out.println("SHA256 Hash: " + sha256(inputStr));
            System.out.println("This cannot be decrypted");
        } else if (choice.equals("4")) {
            System.out.println("SHA512 Hash: " + sha512(inputStr));
            System.out.println("This cannot be decrypted");
        } else {
            System.out.println("Invalid choice");
        }
    }
}
