:- use_module(library(crypto)).
:- use_module(library(base64)).

encode_base64(Message, Encoded) :-
    base64:encode(Message, Encoded).

decode_base64(Encoded, Message) :-
    base64:decode(Encoded, Message).

hash_sha256(Message, Hash) :-
    crypto_hash(Message, Hash, sha256).

hash_sha512(Message, Hash) :-
    crypto_hash(Message, Hash, sha512).

main :-
    write('Choose encoding method: 1) Base64 Encode 2) Base64 Decode 3) SHA256 4) SHA512'), nl,
    read(Choice),
    write('Enter your message:'), nl,
    read(Message),
    ( Choice = 1 -> encode_base64(Message, Encoded), write('Encoded Base64: '), write(Encoded), nl;
      Choice = 2 -> decode_base64(Message, Decoded), write('Decoded Base64: '), write(Decoded), nl;
      Choice = 3 -> hash_sha256(Message, Hash256), write('SHA256: '), write(Hash256), nl, write('This cannot be decrypted.'), nl;
      Choice = 4 -> hash_sha512(Message, Hash512), write('SHA512: '), write(Hash512), nl, write('This cannot be decrypted.'), nl;
      write('Invalid choice.'), nl ).
