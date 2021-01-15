import 'package:http/http.dart' as http;
import 'package:practice/constants/strings.dart';
import 'package:practice/models/postModel.dart';

Future<UserModel> createUser(String name, String jobTitle) async {
  //final String apiUrl = 'https://reqres.in/api/users';
  final response =
      await http.post(Strings.apiUrl, body: {"name": name, "job": jobTitle});
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}
