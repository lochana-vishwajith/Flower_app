import 'dart:async';
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
  // var isLoaded = false;
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    getFlowers();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future getFlowers() async {
    final flowers = await FlowerItemProvider().searchFlower(query);

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

  // Widget loadFlowers() {
  //   return FutureBuilder(
  //       future: FlowerItemProvider().getAllFlowers(),
  //       builder: (
  //         BuildContext context,
  //         AsyncSnapshot<List<FlowerModel>?> model,
  //       ) {
  //         if (model.hasData) {
  //           return flowerList(model.data);
  //         }
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  // }

  Widget searchBar() =>
      SearchWidget(text: query, onChanged: searchFlower, hint: 'Search Flower');

  Future searchFlower(String query) async => debounce(() async {
        final singleFlower = await FlowerItemProvider().searchFlower(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.flowers = singleFlower;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              searchBar(),
              // loadFlowers(),
              flowerList(flowers),
              // Expanded(
              //     child: ListView.builder(
              //         itemCount: flowers!.length,
              //         itemBuilder: (context, index) {
              //           final flower = flowers![index];
              //           return buildFlower(flower);
              //         }))
            ],
          ),
        ));
  }

  // Widget buildFlower(FlowerModel flower) => ListTile(
  //       title: Text(flower.genus!),
  //       subtitle: Text(flower.family!),
  //     );
}
