import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:client/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProvider extends ChangeNotifier {
  String data_url = "https://ctse-flowerapp.herokuapp.com";
  String local_data_url = "http://192.168.1.11:5000";
  final storage = new FlutterSecureStorage();

  //get user
  @override
  Future<List<UserModel>> fetchUser() async {
    List<UserModel> user = [];
    //await storage.read(key: "token");

    try {
      var url = Uri.parse(
          '${local_data_url}/users/user-profile/${await storage.read(key: "id")}');
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

  //register user
  Future<UserModel> registerUser(
      String username, String password, String email) async {
    var url = Uri.parse('${data_url}/users/register');

    try {
      var response = await http.post(
        url,
        // body: {"username": username, "password": password, "email": email},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
          "email": email
        }),
      );
      var data = response.body;
      print("response body - ${data}");

      if (response.statusCode == 200) {
        //  print("decoded body - ${json.decode(response.body)['data']['id']}");
        var res = UserModel.fromJson(json.decode(response.body));
        return res;
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }

  //login user
  Future<UserModel> loginUser(String username, String password) async {
    var url = Uri.parse('${data_url}/users/login');

    try {
      var response = await http.post(
        url,
        // body: {"username": username, "password": password, "email": email},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
        }),
      );
      var data = response.body;
      print("response body - ${data}");

      if (response.statusCode == 200) {
        await storage.write(
            key: "token",
            value: json.decode(response.body)['data']['token'].toString());
        await storage.write(
            key: "id",
            value: json.decode(response.body)['data']['id'].toString());
        String? val = await storage.read(key: "id");
        String? val1 = await storage.read(key: "token");
        print("ID - ${val}");
        print("Token - ${val1}");

        // print("decoded body - ${json.decode(response.body)['data']['id']}");
        var res = UserModel.fromJson(json.decode(response.body));

        return res;
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }

  //delete user
  Future<UserModel> deleteUser() async {
    var url = Uri.parse('http://192.168.1.11:5000/users/delete-user');
    //String Userid = await storage.read(key: "id").toString();

    try {
      var response = await http.delete(
        url,
        // body: {"username": username, "password": password, "email": email},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "id": "${await storage.read(key: "id")}",
        }),
      );
      var data = response.body;
      print("response body - ${data}");

      if (response.statusCode == 200) {
        //  print("decoded body - ${json.decode(response.body)['data']['id']}");
        var res = UserModel.fromJson(json.decode(response.body));
        return res;
      } else {
        throw Exception('Failed to delete');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }

  //update user
  Future<UserModel> updateUser(String bio, String mobile) async {
    var url = Uri.parse('http://192.168.1.11:5000/users/update-profile');
    //String Userid = await storage.read(key: "id").toString();

    try {
      var response = await http.put(
        url,
        // body: {"username": username, "password": password, "email": email},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "id": "${await storage.read(key: "id")}",
          "bio": bio,
          "mobile": mobile
        }),
      );
      var data = response.body;
      print("response body - ${data}");

      if (response.statusCode == 200) {
        //  print("decoded body - ${json.decode(response.body)['data']['id']}");
        var res = UserModel.fromJson(json.decode(response.body));
        return res;
      } else {
        throw Exception('Failed to update');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }
}
