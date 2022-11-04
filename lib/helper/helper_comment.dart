import '../models/api_comments.dart';
import 'package:http/http.dart' as http;

class CommentHelper {
  Future<List<Comment>?> getComments() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

      // print(response);

      if (response.statusCode == 200) {
        var json = response.body;
        return commentFromJson(json);
      }
    } catch (e) {
      print(e.toString());
      
    }
  }
}
