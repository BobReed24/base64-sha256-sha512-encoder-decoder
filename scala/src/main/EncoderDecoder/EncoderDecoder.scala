import java.util.Base64
import java.security.MessageDigest

object EncoderDecoder {
  def main(args: Array[String]): Unit = {
    println("Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512")
    val choice = scala.io.StdIn.readLine().toInt
    println("Enter your message:")
    val input = scala.io.StdIn.readLine()

    choice match {
      case 1 =>
        val encoded = Base64.getEncoder.encodeToString(input.getBytes)
        println(s"Encoded Base64: $encoded")
      case 2 =>
        val decoded = new String(Base64.getDecoder.decode(input))
        println(s"Decoded Base64: $decoded")
      case 3 =>
        val sha256 = MessageDigest.getInstance("SHA-256").digest(input.getBytes)
        println(s"SHA256: ${sha256.map("%02x".format(_)).mkString}")
        println("This cannot be decrypted.")
      case 4 =>
        val sha512 = MessageDigest.getInstance("SHA-512").digest(input.getBytes)
        println(s"SHA512: ${sha512.map("%02x".format(_)).mkString}")
        println("This cannot be decrypted.")
      case _ => println("Invalid choice.")
    }
  }
}
