import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:client/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String data_url = "https://ctse-flowerapp.herokuapp.com";

  //get todos
  @override
  Future<List<UserModel>> fetchUser() async {
    List<UserModel> user = [];

    try {
      var url =
          Uri.parse('${data_url}/users/user-profile/623f02db9f0bd13199e892a6');
      var response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        var oneUser = body['data'];
        print(oneUser['bio']);

        var username = oneUser['username'];
        var email = oneUser['email'];
        var date = oneUser['date'].toString();
        var bio = oneUser['bio'];
        var myposts = oneUser['myposts'];
        var mydiaries = oneUser['mydiaries'];
        var mobile = oneUser['mobile'].toString();
        var id = oneUser['id'].toString();

        UserModel userModel = UserModel(
            username: username,
            email: email,
            date: date,
            bio: bio,
            myposts: myposts,
            mydiaries: mydiaries,
            mobile: mobile,
            id: id);

        user.add(userModel);
      } else {
        Future.error("Some thing has gone wrong, ${response.statusCode}");
      }

      return user;
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }
}
