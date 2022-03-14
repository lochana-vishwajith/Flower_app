import 'package:client/Providers/flower_item_provider.dart';
import 'package:client/models/flower_model.dart';
import 'package:client/screens/admin/flowerItem.dart';
import 'package:flutter/material.dart';

class FlowerList extends StatefulWidget {
  const FlowerList({Key? key}) : super(key: key);

  @override
  State<FlowerList> createState() => _FlowerListState();
}

class _FlowerListState extends State<FlowerList> {
  List<FlowerModel> flowers = List<FlowerModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
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
              );
            },
          )
        ],
      ),
    );
  }

  Widget loadFlowers() {
    return FutureBuilder(
        // future: Service.getFlowers(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flowers List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adminAdd');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: loadFlowers(),
    );
  }
}
