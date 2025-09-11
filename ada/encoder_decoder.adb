with Ada.Text_IO;
with Ada.Integer_Text_IO;
with GNAT.OS_Lib;
with Ada.Characters.Latin_1;
with Ada.Strings.Fixed;

procedure Encoder_Decoder is
   Input_Message : String (1..100);
   Encoded : String (1..200);
   SHA256_Hash : String (1..64);
   SHA512_Hash : String (1..128);
   Choice : Integer;
begin
   Ada.Text_IO.Put_Line ("Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512");
   Ada.Text_IO.Get(Item => Choice);

   Ada.Text_IO.Put_Line ("Enter your message:");
   Ada.Text_IO.Get_Line (Item => Input_Message);

   case Choice is
      when 1 =>
         -- Simulate Base64 encoding logic
         Ada.Text_IO.Put_Line ("Encoded Base64: " & Encoded);
      when 2 =>
         -- Simulate Base64 decoding logic
         Ada.Text_IO.Put_Line ("Decoded Base64: " & Encoded);
      when 3 =>
         -- Simulate SHA256 hashing logic
         Ada.Text_IO.Put_Line ("SHA256: " & SHA256_Hash);
         Ada.Text_IO.Put_Line ("This cannot be decrypted.");
      when 4 =>
         -- Simulate SHA512 hashing logic
         Ada.Text_IO.Put_Line ("SHA512: " & SHA512_Hash);
         Ada.Text_IO.Put_Line ("This cannot be decrypted.");
      when others =>
         Ada.Text_IO.Put_Line ("Invalid choice.");
   end case;
end Encoder_Decoder;
