import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future getRequestWithoutModel() async {
    final producturl = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(producturl);
    // print(response.body);
    return json.decode(response.body);
  }
}
///////
// to used postmen in your vscode first add the extension of postmen in your vs code then  signup your account 
// then you can easily used. 