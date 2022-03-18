import 'dart:convert';

import 'package:client/models/flower_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class FlowerItemProvider extends ChangeNotifier {
  late FlowerModel flowerMOdel;
  late String id;
  late String family;
  late String tribe;
  late String kingdom;
  late String genus;
  // late String synonym;
  late String bloom;
  late String description;
  // late String imageURL;

  List<FlowerModel> flowers = [];

  void postFlowerItem(BuildContext context) async {
    final response = await http.post(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/flower'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'family': family,
          'tribe': tribe,
          'kingdom': kingdom,
          'genus': genus,
          // 'synonym': synonym,
          'bloom': bloom,
          'description': description,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Flower Added Succesfull',
      );
      Navigator.pushNamed(context, '/adminList');
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Adding Flower',
      );
    }
  }

  Future<List<FlowerModel>> getAllFlowers() async {
    flowers.clear();

    final response = await http
        .get(Uri.parse('https://ctse-flowerapp.herokuapp.com/flower'));

    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      for (Map<String, dynamic> item in data) {
        var flower = FlowerModel.fromJson(item);
        flowers.add(flower);
      }
      return flowers;
    } else {
      notifyListeners();
      Fluttertoast.showToast(msg: 'Error Loading Flower List');
      return flowers;
    }
  }

  void deleteFlower(String id) async {
    print('ID: $id');
    final response = await http
        .delete(Uri.parse('https://ctse-flowerapp.herokuapp.com/flower/$id'));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Flower Deleted Succesfull',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Error',
      );
    }
  }

  void updateFlower(
      String id,
      String family,
      String tribe,
      String kingdom,
      String genus,
      String bloom,
      String description,
      BuildContext context) async {
    final response = await http.put(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/flower/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'family': family,
          'tribe': tribe,
          'kingdom': kingdom,
          'genus': genus,
          // 'synonym': synonym,
          'bloom': bloom,
          'description': description,
          // 'imageURL': imageURL,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Flower Updated',
      );
      Navigator.pushNamed(context, '/adminList');
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Updating Flower',
      );
    }
  }

  Future<List<FlowerModel>> searchFlower(String query) async {
    print(query);
    final response = await http
        .get(Uri.parse('https://ctse-flowerapp.herokuapp.com/flower'));

    if (response.statusCode == 200) {
      notifyListeners();

      final List data = jsonDecode(response.body);

      return data.map((json) => FlowerModel.fromJson(json)).where((flower) {
        final title = flower.genus?.toLowerCase();
        final sub = flower.family?.toLowerCase();
        final searchQuery = query.toLowerCase();

        print(title);

        return title!.contains(searchQuery) || sub!.contains(searchQuery);
      }).toList();
    } else {
      notifyListeners();
      throw Exception();
      // Fluttertoast.showToast(msg: 'Error Loading Flower List');
      // return flowers;
    }
  }
}
