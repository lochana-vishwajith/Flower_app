import 'dart:ffi';

import 'package:client/models/flower_model.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<FlowerModel>? flowers;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              child: Text("Hi"),
            );
          }),
    );
  }
}
