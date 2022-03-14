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
  late String synonym;
  late String bloom;
  late String description;

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
          'synonym': synonym,
          'bloom': bloom,
          'description': description,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Flower Added Succesfull',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Adding Flower',
      );
    }
  }
}
