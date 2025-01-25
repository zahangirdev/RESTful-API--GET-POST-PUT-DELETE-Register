import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class MyApiService {
  Future<UpdateModel?> updateData(String name, String job) async {
    var url = Uri.parse("https://reqres.in/api/users/2");
    var response = await http.put(url, body: {"name": name, "job": job});

    try {
      if (response.statusCode == 200) {
        UpdateModel model = UpdateModel.fromJson(jsonDecode(response.body));
        print(response.body);
        print("Data Update Successflly");
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
