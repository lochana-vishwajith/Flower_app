import 'dart:io';

import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/Providers/user_provider.dart';
import 'package:client/models/forum_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class StartConversation extends StatefulWidget {
  static const String routeName = '/start_conversation';

  const StartConversation({Key? key}) : super(key: key);

  @override
  State<StartConversation> createState() => _StartConversationState();
}

class _StartConversationState extends State<StartConversation> {
  final formKey = GlobalKey<FormState>();

  var question = '';
  var description = '';
  bool isImageSelected = false;
  var imageUrl = '';
  var userId = ForumItemProvider.uid;
  ForumItem? forumItem;
  final questionController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    questionController.dispose();
    descriptionController.dispose();
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
    final forumProvider = context.read<ForumItemProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Conversation"),
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
                        flowerImagePicker(
                            isImageSelected, forumItem?.imageUrl ?? "", (file) {
                          setState(() {
                            forumItem?.imageUrl = file.path;
                            isImageSelected = true;
                          });
                        }),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: questionController,
                            onChanged: (value) =>
                                {forumProvider.question = value},
                            decoration: InputDecoration(
                                labelText: "Your Question",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter A Question.";
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
                                {forumProvider.description = value},
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
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final isValid =
                                    formKey.currentState?.validate();
                                if (isValid == true) {
                                  forumProvider.postForumItem(context, userId);
                                }
                              },
                              icon: const Icon(Icons.post_add),
                              label: const Text("Post Question"),
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
