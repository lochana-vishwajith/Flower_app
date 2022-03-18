import 'dart:ui';

import 'package:client/models/flower_model.dart';
import 'package:client/screens/admin/flowerItem.dart';
import 'package:flutter/material.dart';

class FlowerView extends StatefulWidget {
  static const String routeName = '/flower_view';
  const FlowerView({Key? key}) : super(key: key);

  @override
  State<FlowerView> createState() => _FlowerViewState();
}

Widget FlowerDetails(context) {
  final FlowerModel? args =
      ModalRoute.of(context)!.settings.arguments as FlowerModel?;
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.network(
                (args!.imageUrl == null || args.imageUrl == "")
                    ? "https://www.babypillowth.com/images/templates/upload.png"
                    : args.imageUrl!.toString(),
                height: 150,
                width: 150,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Kingdom: ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '${args.kingdom}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Family: ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '${args.family}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Genus: ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '${args.genus}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Tribe: ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '${args.tribe}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Column(
        //     children: [
        //       const Text(
        //         'Synonyms: ',
        //         style: TextStyle(fontSize: 20.0),
        //       ),
        //       Text(
        //         '${args.synonym}',
        //         style: const TextStyle(
        //             fontSize: 20.0, fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Blooming Seasons: ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '${args.bloom}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Description: ',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  '${args.description}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _FlowerViewState extends State<FlowerView> {
  @override
  Widget build(BuildContext context) {
    final FlowerModel? args =
        ModalRoute.of(context)!.settings.arguments as FlowerModel?;
    return Scaffold(
        appBar: AppBar(title: Text(args!.genus!)),
        body: FlowerDetails(context));
  }
}
