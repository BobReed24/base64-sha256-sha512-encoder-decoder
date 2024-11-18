#lang racket

(define (base64-encode message)
  (base64-encode-string message))

(define (base64-decode encoded)
  (base64-decode-string encoded))

(define (sha256 message)
  (bytes->hex (sha256 (string->bytes/utf-8 message))))

(define (sha512 message)
  (bytes->hex (sha512 (string->bytes/utf-8 message))))

(define message (read-line))
(display "Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512\n")
(define choice (read-line))

(cond
  [(= choice "1") (display (string-append "Encoded Base64: " (base64-encode message)))]
  [(= choice "2") (display (string-append "Decoded Base64: " (base64-decode message)))]
  [(= choice "3") (display (string-append "SHA256: " (sha256 message)))]
  [(= choice "4") (display (string-append "SHA512: " (sha512 message)))]
  [else (display "Invalid choice.")])

(display "This cannot be decrypted.")
