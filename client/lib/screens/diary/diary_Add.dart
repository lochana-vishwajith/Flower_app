import 'dart:async';
import 'dart:io';

import 'package:client/Providers/diary_item_provider.dart';
import 'package:client/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateDiary extends StatefulWidget {
  static const String routeName = '/creatediary';

  const CreateDiary({Key? key}) : super(key: key);

  @override
  State<CreateDiary> createState() => _CreateDiaryState();
}

class _CreateDiaryState extends State<CreateDiary> {
  final formKey = GlobalKey<FormState>();

  var tittle = '';
  var description = '';
  var keyword='';
  bool isImageSelected = false;
  var image = '';
  DiaryItem? diaryItem;
  final tittleController = TextEditingController();
  final descriptionController = TextEditingController();
  final keywordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    tittleController.dispose();
    descriptionController.dispose();
    keywordController.dispose();
  }

  @override
  void initState() {
    super.initState();
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
    final diaryProvider = context.read<DiaryItemProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Start your Diary Blog"),
      ),
      body: Form(
          key: formKey,
          child: SafeArea(child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: keywordController,
                            onChanged: (value) =>
                            {diaryProvider.keyword = value},
                            decoration: InputDecoration(
                                labelText: "add keywords",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter A Keyword.";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: tittleController,
                            onChanged: (value) =>
                            {diaryProvider.title = value},
                            decoration: InputDecoration(
                                labelText: "add your title",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter A Tittle.";
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
                            {diaryProvider.description = value},
                            decoration: InputDecoration(
                                labelText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 1,
                            maxLines: 10,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter A Description.";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        flowerImagePicker(
                            isImageSelected, diaryItem?.image ?? "", (file) {
                          setState(() {
                            diaryItem?.image = file.path;
                            isImageSelected = true;
                          });
                        }),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final isValid =
                                formKey.currentState?.validate();
                                if (isValid == true) {
                                  diaryProvider.postDiaryItem(context);
                                  Timer(const Duration(seconds:1), () {
                                    Navigator.of(context)
                                        .pushNamed('/');
                                  });
                                }
                              },
                              icon: const Icon(Icons.post_add),
                              label: const Text("Post Diary"),
                              style: ElevatedButton.styleFrom(
                                primary:
                                const Color.fromARGB(255, 121, 180, 112),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ))),
    );
  }
}
