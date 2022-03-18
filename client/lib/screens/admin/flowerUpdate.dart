import 'dart:io';

import 'package:client/Providers/flower_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../models/flower_model.dart';

class FlowerUpdate extends StatefulWidget {
  static const String routeName = '/flower_update';

  const FlowerUpdate({Key? key}) : super(key: key);

  @override
  State<FlowerUpdate> createState() => _FlowerUpdateState();
}

class _FlowerUpdateState extends State<FlowerUpdate> {
  final formKey = GlobalKey<FormState>();

  bool isImageSelected = false;
  FlowerModel? flowerModel;

  var family = '';
  var tribe = '';
  var kingdom = '';
  var genus = '';
  // var synonym = '';
  var bloom = '';
  var description = '';
  var imageUrl = '';

  final familyController = TextEditingController();
  final tribeController = TextEditingController();
  final kingdomController = TextEditingController();
  final genusController = TextEditingController();
  // final synonymController = TextEditingController();
  final bloomController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    familyController.dispose();
    tribeController.dispose();
    kingdomController.dispose();
    genusController.dispose();
    // synonymController.dispose();
    bloomController.dispose();
    descriptionController.dispose();
  }

  @override
  void initState() {
    super.initState();

    flowerModel = FlowerModel(
        bloom: '',
        description: '',
        family: '',
        genus: '',
        id: '',
        kingdom: '',
        // synonym: '',
        tribe: '');

    Future.delayed(Duration.zero, (() {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        flowerModel = arguments['model'];
        setState(() {});
      }
    }));
  }

  static Widget flowerImagePicker(
    bool isImageSelected,
    String imageName,
    Function onImagePicked,
  ) {
    Future<XFile?> _imageFie;
    ImagePicker _imagePicker = ImagePicker();

    return Column(
      children: [
        imageName.isNotEmpty
            ? isImageSelected
                ? Image.file(
                    File(imageName),
                    height: 100,
                    width: 100,
                  )
                : SizedBox(
                    child: Image.network(
                      imageName,
                      width: 100,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  )
            : SizedBox(
                child: Image.network(
                  "https://www.babypillowth.com/images/templates/upload.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.scaleDown,
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
              width: 30.0,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    Icons.image,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _imageFie =
                        _imagePicker.pickImage(source: ImageSource.gallery);
                    _imageFie.then((file) async {
                      onImagePicked(file);
                    });
                  }),
            ),
            SizedBox(
                height: 30.0,
                width: 30.0,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.camera,
                      size: 30.0,
                    ),
                    onPressed: () {
                      _imageFie =
                          _imagePicker.pickImage(source: ImageSource.camera);
                      _imageFie.then((file) async {
                        onImagePicked(file);
                      });
                    }))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final flowerProvider = context.read<FlowerItemProvider>();
    // final FlowerModel? args =
    //     ModalRoute.of(context)!.settings.arguments as FlowerModel;

    kingdomController.text = flowerModel!.kingdom!;
    familyController.text = flowerModel!.family!;
    tribeController.text = flowerModel!.tribe!;
    genusController.text = flowerModel!.genus!;
    bloomController.text = flowerModel!.bloom!;
    // synonymController.text = flowerModel!.synonym!;
    descriptionController.text = flowerModel!.description!;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flower Update'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
            key: formKey,
            child: SafeArea(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            flowerImagePicker(
                                isImageSelected, flowerModel?.imageUrl ?? "",
                                (file) {
                              setState(() {
                                flowerModel!.imageUrl = file.path;
                                isImageSelected = true;
                              });
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: kingdomController,
                                onChanged: (value) =>
                                    {flowerProvider.kingdom = value},
                                decoration: InputDecoration(
                                    labelText: "Kingdom",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Kingdom Can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: familyController,
                                onChanged: (value) =>
                                    {flowerProvider.family = value},
                                decoration: InputDecoration(
                                    labelText: "Family",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Family Can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: tribeController,
                                onChanged: (value) =>
                                    {flowerProvider.tribe = value},
                                decoration: InputDecoration(
                                    labelText: "Tribe",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Tribe Can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: genusController,
                                onChanged: (value) =>
                                    {flowerProvider.genus = value},
                                decoration: InputDecoration(
                                    labelText: "Genus",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Genus Can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(5),
                            //   child: TextFormField(
                            //     controller: synonymController,
                            //     onChanged: (value) =>
                            //         {flowerProvider.synonym = value},
                            //     decoration: InputDecoration(
                            //         labelText: "Synonyms",
                            //         border: OutlineInputBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(10))),
                            //     validator: (value) {
                            //       if (value!.isEmpty) {
                            //         return "Synonym Can't be Empty";
                            //       } else {
                            //         return null;
                            //       }
                            //     },
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: bloomController,
                                onChanged: (value) =>
                                    {flowerProvider.bloom = value},
                                decoration: InputDecoration(
                                    labelText: "Blooming Seasons",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Blooming Seasons Can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: descriptionController,
                                onChanged: (value) =>
                                    {flowerProvider.description = value},
                                decoration: InputDecoration(
                                    labelText: "Description",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                minLines: 2,
                                maxLines: 10,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Description Can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    final isValid =
                                        formKey.currentState?.validate();
                                    if (isValid == true) {
                                      var updatedKingdom =
                                          kingdomController.text;
                                      var updatedFamily = familyController.text;
                                      var updatedTribe = tribeController.text;
                                      var updatedGenus = genusController.text;
                                      var updatedBloom = bloomController.text;
                                      var updatedDescription =
                                          descriptionController.text;

                                      if (kingdom == kingdomController.text) {
                                        updatedKingdom = kingdom;
                                      }

                                      if (family == familyController.text) {
                                        updatedFamily = family;
                                      }

                                      if (tribe == tribeController.text) {
                                        updatedTribe = tribe;
                                      }

                                      if (genus == genusController.text) {
                                        updatedGenus = genus;
                                      }

                                      if (bloom == bloomController.text) {
                                        updatedBloom = bloom;
                                      }

                                      if (description ==
                                          descriptionController.text) {
                                        updatedDescription = description;
                                      }

                                      flowerProvider.updateFlower(
                                          flowerModel!.id!,
                                          updatedFamily,
                                          updatedTribe,
                                          updatedKingdom,
                                          updatedGenus,
                                          updatedBloom,
                                          updatedDescription,
                                          context);
                                    }
                                  },
                                  icon: const Icon(Icons.add_box),
                                  label: const Text("Update Flower"),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 121, 180, 112),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
