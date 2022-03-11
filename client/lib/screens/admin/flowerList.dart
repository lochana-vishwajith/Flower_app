import 'package:client/models/flower_model.dart';
import 'package:client/screens/admin/flowerItem.dart';
import 'package:client/service.dart';
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

    //   flowers.add(FlowerModel(
    //     id: "1",
    //     family: "Asteraceae",
    //     tribe: "Heliantheae",
    //     kingdom: "Plantae",
    //     genus: "Helianthus",
    //     synonym: "",
    //     bloom:
    //         "Before blooming, sunflower plants tilt during the day to face the Sun in order to gain more sunlight for photosynthesis. This heliotropism continues for a short time when the plant blooms, young sunflower heads tracking of the Sun. This is thought to help attract pollinators, as many are more attracted to warm flowers. By the time they are mature, though, sunflowers generally stop moving to remain facing east. which lets them be warmed by the rising sun.",
    //     description:
    //         "Sunflowers are thought to have been domesticated 30005000 years ago by Native Americans who would use them primarily as a source for edible seeds. They were then introduced to Europe in the early 16th century and made their way to the Russian Empire. In the Russian Empire, where oilseed cultivators were located, these flowers were developed and grown on an industrial scale. The Russian Empire then reintroduced this oilseed cultivation process to North America in the mid-20th century; North America began their commercial era of sunflower production and breeding. New breeds of the Helianthus spp. began to become more prominent in new geographical areas.",
    //     imageUrl:
    //         "https://images.unsplash.com/photo-1597848212624-a19eb35e2651?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3VuZmxvd2Vyc3xlbnwwfHwwfHw%3D&w=1000&q=80",
    //   ));

    //   flowers.add(FlowerModel(
    //     id: "2",
    //     family: "Asteraceae",
    //     tribe: "Heliantheae",
    //     kingdom: "Plantae",
    //     genus: "Sample",
    //     synonym: "",
    //     bloom:
    //         "Before blooming, sunflower plants tilt during the day to face the Sun in order to gain more sunlight for photosynthesis. This heliotropism continues for a short time when the plant blooms, young sunflower heads tracking of the Sun. This is thought to help attract pollinators, as many are more attracted to warm flowers. By the time they are mature, though, sunflowers generally stop moving to remain facing east. which lets them be warmed by the rising sun.",
    //     description:
    //         "Sunflowers are thought to have been domesticated 30005000 years ago by Native Americans who would use them primarily as a source for edible seeds. They were then introduced to Europe in the early 16th century and made their way to the Russian Empire. In the Russian Empire, where oilseed cultivators were located, these flowers were developed and grown on an industrial scale. The Russian Empire then reintroduced this oilseed cultivation process to North America in the mid-20th century; North America began their commercial era of sunflower production and breeding. New breeds of the Helianthus spp. began to become more prominent in new geographical areas.",
    //     imageUrl:
    //         "https://images.unsplash.com/photo-1597848212624-a19eb35e2651?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3VuZmxvd2Vyc3xlbnwwfHwwfHw%3D&w=1000&q=80",
    //   ));
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
        future: Service.getFlowers(),
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
