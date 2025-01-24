import 'get_model.dart';
import 'package:http/http.dart' as http;

class GetApiService {
  Future<List<CommentModel>?> getCommentsModel() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await data.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentModelFromJson(json);
    }
    return null;
  }
}
