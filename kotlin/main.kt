import java.util.Base64
import java.security.MessageDigest

fun main() {
    println("Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512")
    val choice = readLine()!!
    
    println("Enter your message:")
    val input = readLine()!!

    when(choice) {
        "1" -> {
            val encoded = Base64.getEncoder().encodeToString(input.toByteArray())
            println("Encoded Base64: $encoded")
        }
        "2" -> {
            try {
                val decoded = String(Base64.getDecoder().decode(input))
                println("Decoded Base64: $decoded")
            } catch (e: IllegalArgumentException) {
                println("Invalid Base64 input")
            }
        }
        "3" -> {
            val sha256 = MessageDigest.getInstance("SHA-256")
            val hash = sha256.digest(input.toByteArray()).joinToString("") { "%02x".format(it) }
            println("SHA256: $hash")
            println("This cannot be decrypted.")
        }
        "4" -> {
            val sha512 = MessageDigest.getInstance("SHA-512")
            val hash = sha512.digest(input.toByteArray()).joinToString("") { "%02x".format(it) }
            println("SHA512: $hash")
            println("This cannot be decrypted.")
        }
        else -> println("Invalid choice.")
    }
}
