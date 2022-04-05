import 'dart:async';

import 'package:client/Providers/diary_item_provider.dart';
import 'package:client/models/diary_model.dart';
import 'package:client/screens/search/search_widget.dart';
import 'package:flutter/material.dart';

import '../../Components/blog_component.dart';


class DiarySearch extends StatefulWidget {
  const DiarySearch({Key? key}) : super(key: key);

  @override
  State<DiarySearch> createState() => _DiarySearchState();
}

class _DiarySearchState extends State<DiarySearch> {
  List<DiaryItem>? diaries = [];
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
    final diaries = await DiaryItemProvider().searchDiary(query);

    setState(() {
      this.diaries = diaries;
    });
  }

  Widget diaryList(diaries) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: diaries.length,
            itemBuilder: (context, index) {
              return BlogComponent(
                model: diaries[index],
              );
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
      SearchWidget(text: query, onChanged: searchDiary, hint: 'Search diary');

  Future searchDiary(String query) async => debounce(() async {
    final filteredDiary = await DiaryItemProvider().searchDiary(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.diaries = filteredDiary;
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
              diaryList(diaries),
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
