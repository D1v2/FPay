import 'package:encrypt/encrypt.dart';

class PinEncryption {

  String keys = "TDSKey";

  String getPin(String pin) {
 /*   final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = Key.fromUtf8("TDSKey");
    final iv = IV.fromLength(6);
    final encrypter = Encrypter(AES(key,mode: AESMode.ecb));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print("encrypted --- ${encrypted.base64}");
    print("---- dec  ----- $decrypted");
    print(encrypted.base64);*/
/*    final key = Key.fromUtf8(keys);
    final iv = IV.fromLength(6);
    final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(pin, iv: iv);
    print("------ ${encrypted}");
    return "encrypted";*/




    /* var encrypted = encryptWithAES(keys, "1234");
    var message = encrypted.base16;
    print("-----  $message");
    String decryptedText = decryptWithAES(keys, encrypted);
    print("-------de  $decryptedText");*/


   /*  var cipherKey = Key.fromUtf8(keys);
    var a = Encrypter(AES(cipherKey, mode: AESMode.ecb));
    final iv = IV.fromUtf8(keys.substring(0,16));
    final encrypt = a.encrypt("1234",iv: iv);
    print("--------- $encrypt");
    final decrypt = a.decrypt(encrypt,iv: iv);
    print("decripted ----  $decrypt");*/
    return "";
  }


  String decryption(String plainText) {
    final key = Key.fromBase64(keys);
    final iv = IV.fromBase64(keys);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final decrypted = encrypter.decrypt(Encrypted.from64(plainText), iv: iv);
    print("---des   $decrypted");
    return decrypted;
  }


  Encrypted encryptWithAES(String key, String plainText) {
    final cipherKey = Key.fromUtf8(key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.ecb));
    final initVector = IV.fromLength(16);
    Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
    return encryptedData;
  }
  String decryptWithAES(String key, Encrypted encryptedData) {
    final cipherKey = Key.fromUtf8(key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.ecb)); //Using AES CBC encryption
    final initVector = IV.fromLength(16); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.

    return encryptService.decrypt(encryptedData, iv: initVector);
  }
}

/*
AES Encryption
key =TDESKey
Mode = ECB
Padding =PKCS7
Password = !Vipin0562*/
