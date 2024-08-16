import 'dart:convert';
import 'package:crypto/crypto.dart';

class Formatters {
  static String calculateHmacMd5(String stdId, String sifreStr) {
    //to md5 profile picture
    // Convert the input strings to bytes
    List<int> stdIdBytes = utf8.encode(stdId);
    List<int> sifreStrBytes = utf8.encode(sifreStr);

    // Calculate the HMAC-MD5 hash
    Hmac hmacMd5 = Hmac(md5, sifreStrBytes);
    Digest hmacMd5Result = hmacMd5.convert(stdIdBytes);

    // Convert the hash result to a hex string
    String hmacMd5String = hmacMd5Result.toString();

    return hmacMd5String;
  }
}
