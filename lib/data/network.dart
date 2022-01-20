import 'package:http/http.dart';
import 'dart:convert';


class Network {

  Future<dynamic> getJsonData(String url) async {

    Response response = await get(Uri.parse(url));

    if(response.statusCode == 200) {
      String jsonData = response.body;

      return jsonDecode(jsonData);
 
    } else {
      print(response.statusCode);
      return null;
    }
  }


  
}