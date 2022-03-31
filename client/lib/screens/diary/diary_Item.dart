import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../../Providers/forum_Item_provider..dart';
//import '../../models/forum_items.dart';

import '../../Providers/diary_item_provider.dart';
import '../../models/diary_model.dart';

class ViewDiary extends StatefulWidget {
  static const String routeName = '/viewdiary';

  const ViewDiary({Key? key}) : super(key: key);

  @override
  State<ViewDiary> createState() => _ViewDiaryState();
}

class _ViewDiaryState extends State<ViewDiary> {
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("View Post"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Center(
                      child: Image.network(
                        "https://www.babypillowth.com/images/templates/upload.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(args!.title),
                            ),
                            ListBody(
                              children: [Text(args.description)],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "Replies",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)),
                              elevation: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    ListTile(
                                      title: Text(
                                          "This shold be asked from an area agri office"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                    Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Write a reply"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter A Reply.";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: ElevatedButton(
                                    onPressed: () {
                                      final isValid =
                                      formKey.currentState?.validate();
                                    },
                                    child: const Icon(Icons.send_outlined)),
                              ),
                            )
                          ]),
                        ))
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
