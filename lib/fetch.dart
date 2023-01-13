import 'dart:convert';
import 'package:http/http.dart' as http;

class Fetch {
  static Future<String> calc(String s) async {
    var url = Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/$s");
    var response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);
    // ignore: avoid_print
    print((((data[0]['meanings'])[0]['definitions'])[0])['definition']);
    //print(((data[0]['phonetics'])[1])['audio']);
    return ((((data[0]['meanings'])[0]['definitions'])[0])['definition']);
  }
}
