import 'dart:ui';

import 'package:client/models/flower_model.dart';
import 'package:flutter/material.dart';

class FlowerItem extends StatelessWidget {
  const FlowerItem({Key? key, this.model, this.onDelete}) : super(key: key);

  final FlowerModel? model;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 199, 248, 204),
              borderRadius: BorderRadius.circular(10.0)),
          child: flowerWidget(context),
        ));
  }

  Widget flowerWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            (model!.imageUrl == null || model!.imageUrl == "")
                ? "https://www.babypillowth.com/images/templates/upload.png"
                : model!.imageUrl!,
            height: 70,
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model!.genus!,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "${model!.kingdom}",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: const Icon(Icons.delete_forever_outlined),
                      onTap: () {
                        onDelete!(model);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
