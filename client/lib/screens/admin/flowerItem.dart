import 'package:client/models/flower_model.dart';
import 'package:client/screens/search/flowerView.dart';
import 'package:flutter/material.dart';

class FlowerItem extends StatelessWidget {
  // const FlowerItem({Key? key, this.model, this.onDelete,required this.user}) : super(key: key);
  FlowerItem({Key? key, this.model, this.onDelete, required this.user})
      : super(key: key);

  final FlowerModel? model;
  final Function? onDelete;
  var user;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              color: Color.fromARGB(193, 216, 238, 164),
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
          width: 100,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          child: Image.network(
            (model!.imageUrl == null || model!.imageUrl == "")
                ? "https://www.babypillowth.com/images/templates/upload.png"
                : model!.imageUrl!,
            height: 60,
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
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
              if (user == 'admin')
                Container(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.edit),
                        onTap: () {
                          Navigator.of(context).pushNamed('/adminEdit',
                              arguments: {'model': model});
                        },
                      ),
                      GestureDetector(
                        child: const Icon(Icons.delete_forever_outlined),
                        onTap: () {
                          onDelete!(model);
                        },
                      ),
                    ],
                  ),
                ),
              if (user == 'normal')
                Container(
                  width: MediaQuery.of(context).size.width - 160,
                  height: MediaQuery.of(context).size.height - 660,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.pushNamed(context, FlowerView.routeName,
                                arguments: FlowerModel(
                                    id: model!.id,
                                    family: model!.family,
                                    tribe: model!.tribe,
                                    kingdom: model!.kingdom,
                                    genus: model!.genus,
                                    synonym: model!.synonym,
                                    bloom: model!.bloom,
                                    description: model!.description));
                          },
                        ),
                      ]),
                ),
            ],
          ),
        )
      ],
    );
  }
}
