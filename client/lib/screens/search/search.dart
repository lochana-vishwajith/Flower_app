import 'dart:ffi';

import 'package:client/Providers/flower_item_provider.dart';
import 'package:client/models/flower_model.dart';
import 'package:client/screens/search/search_widget.dart';
import 'package:flutter/material.dart';

import '../admin/flowerItem.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<FlowerModel>? flowers = [];
  var isLoaded = false;
  String query = '';

  @override
  void initState() {
    super.initState();

    getFlowers();
  }

  Future getFlowers() async {
    final flowers = await FlowerItemProvider().getAllFlowers();

    setState(() {
      this.flowers = flowers;
    });
  }

  Widget flowerList(flowers) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: flowers.length,
            itemBuilder: (context, index) {
              return FlowerItem(
                  model: flowers[index],
                  onDelete: (FlowerModel model) {},
                  user: 'normal');
            },
          )
        ],
      ),
    );
  }

  Widget loadFlowers() {
    return FutureBuilder(
        future: FlowerItemProvider().getAllFlowers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<FlowerModel>?> model,
        ) {
          if (model.hasData) {
            return flowerList(model.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget searchBar() =>
      SearchWidget(text: query, onChanged: searchFlower, hint: 'Search Flower');

  void searchFlower(String query) {
    final singleflower = flowers?.where((flower) {
      final title = flower.genus?.toLowerCase();
      final sub = flower.family?.toLowerCase();
      final searchQuery = query.toLowerCase();

      return title!.contains(searchQuery) || sub!.contains(searchQuery);
    }).toList();

    setState(() {
      this.query = query;
      this.flowers = flowers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Column(
          children: [
            searchBar(),
            loadFlowers(),
          ],
        ));
  }
}
