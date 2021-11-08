import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    return http.get(Uri.parse("http://10.0.2.2/profile/getProfile.php"));
  }
}
