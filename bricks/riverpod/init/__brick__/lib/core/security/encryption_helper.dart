import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncryptionHelper {
  EncryptionHelper._();

  static String hashSha256(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }

  static String encodeBase64(String input) {
    return base64Encode(utf8.encode(input));
  }

  static String decodeBase64(String input) {
    return utf8.decode(base64Decode(input));
  }
}
