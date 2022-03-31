import 'package:client/Providers/diary_item_provider.dart';
import 'package:client/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateDiary extends StatefulWidget {
  static const String routeName = '/update_diary';

  const UpdateDiary({Key? key}) : super(key: key);

  @override
  State<UpdateDiary> createState() => _UpdateDiaryState();
}

class _UpdateDiaryState extends State<UpdateDiary> {
  final formKey = GlobalKey<FormState>();

  var title = '';
  var description = '';

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final diaryProvider = context.read<DiaryItemProvider>();
    final DiaryItem? args =
    ModalRoute.of(context)!.settings.arguments as DiaryItem?;

    final String? titleVal = args?.title;
    final String? descriptionVal = args?.description;

    titleController.text = args!.title;
    descriptionController.text = args.description;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update diary"),
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
                            controller: titleController,
                            onChanged: (value) =>
                            {diaryProvider.title = value},
                            decoration: InputDecoration(
                                labelText: "Your Question",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter A title.";
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
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final isValid =
                                formKey.currentState?.validate();
                                if (isValid == true) {
                                  print("title $title");
                                  print(
                                      "controller question ${titleController.text}");
                                  var updatedtitle = titleController.text;
                                  var updatedDes = descriptionController.text;

                                  if (title == titleController.text) {
                                    updatedtitle = title;
                                  }

                                  if (description ==
                                      descriptionController.text) {
                                    updatedDes = description;
                                  }

                                  diaryProvider.updateDiary(
                                      args.id, updatedtitle, updatedDes);
                                }
                              },
                              icon: const Icon(Icons.post_add),
                              label: const Text("Update Post"),
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
