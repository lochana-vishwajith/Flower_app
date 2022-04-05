import 'dart:convert';

import 'package:client/models/diary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class DiaryItemProvider extends ChangeNotifier {
  late DiaryItem diaryItem;
  late String id;
  late String title;
  late String description;
  late String image;
  late String keyword;
  late String userId;
  static String uid = '';

  List<DiaryItem> posts = [];

  void setDiaryId(String id) {
    this.id = id;
  }

  String getDiaryId() {
    return this.id;
  }

  void setDiaryDescription(String description) {
    this.description = description;
  }

  String getDiaryDescription() {
    return this.description;
  }

  void setDiaryTittle(String tittle) {
    this.title = tittle;
  }

  String getDiaryTittle() {
    return this.title;
  }

  void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  String getKeyword() {
    return this.keyword;
  }


  String getuserId() {
    return this.userId;
  }

  void setuserId(String userId) {
    print('mage id $userId');
    this.userId = userId;
    uid = userId;
  }


  void postDiaryItem(BuildContext context) async {
    print('title $title description $description');
    final response = await http.post(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/diary'),//edit link
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'description': description,
          'keyword': keyword,
          'userId': uid,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Your blog has Created on $title',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'An Error Occured Please Re-Submit your Blog',
      );
    }
  }

  void deleteDiary(String id) async {
    final response = await http
        .delete(Uri.parse('https://ctse-flowerapp.herokuapp.com/diary/$id'));//edit link

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Your Diary Deleted',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Deleting diary',
      );
    }
  }

  Future<List<DiaryItem>> getAllDiaryPosts() async {
    posts.clear();

    final response =
    await http.get(Uri.parse('https://ctse-flowerapp.herokuapp.com/diary')); //edit link
    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      print("response $data");

      for (Map<String, dynamic> item in data) {
        var post = DiaryItem.fromJson(item);
        posts.add(post);
      }
      print('posts $posts');
      return posts;
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'An Error ocured',
      );

      return posts;
    }
  }

  Future<List<DiaryItem>> getUserDiaryPosts(String id) async {
    posts.clear();

    final response = await http.get(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/diary/userId/$id'));//edit link

    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      print("response $data");

      for (Map<String, dynamic> item in data) {
        var post = DiaryItem.fromJson(item);
        posts.add(post);
      }
      return posts;
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Getting your diaries',
      );

      return posts;
    }
  }

  void updateDiary(String id, String title, String description,String keyword) async {
    final response = await http.put(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/diary/$id'), //edit
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'description': description,
          'keyword': keyword,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Diary Updated',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Updating Diary',
      );
    }
  }


  Future<List<DiaryItem>> searchDiary(String query) async {
    print(query);
    final response = await http
        .get(Uri.parse('https://ctse-flowerapp.herokuapp.com/diary'));

    if (response.statusCode == 200) {
      notifyListeners();

      final List data = jsonDecode(response.body);

      return data.map((json) => DiaryItem.fromJson(json)).where((diary) {
        final title = diary.title.toLowerCase();
        final sub = diary.keyword.toLowerCase();
        final searchQuery = query.toLowerCase();

        print(title);

        return title.contains(searchQuery) || sub.contains(searchQuery);
      }).toList();
    } else {
      notifyListeners();
      throw Exception();
      // Fluttertoast.showToast(msg: 'Error Loading Flower List');
      // return flowers;
    }
  }



}
