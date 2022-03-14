import 'dart:developer';
import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/models/forum_items.dart';
import 'package:flutter/material.dart';
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
                                  forumProvider.postForumItem(context);
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
