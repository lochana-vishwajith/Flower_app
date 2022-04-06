import 'package:flutter/material.dart';
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
    final DiaryItem? args =
    ModalRoute.of(context)!.settings.arguments as DiaryItem?;

    return Scaffold(
      appBar: AppBar(
        title:  Text(args!.title),
      ),
      backgroundColor: Colors.lightGreenAccent.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Chip(
                      label: Text('Keyword - ${args.keyword}'.toUpperCase(),
                      style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Image.network(
                        "https://www.babypillowth.com/images/templates/upload.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Card(
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          ListTile(

                            title: Text(args.date,
                                style: const TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.bold)),
                            tileColor: Colors.blueGrey,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "BLOG CONTENT",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            // width: MediaQuery.of(context).size.width - 160,
                            child: Text(
                              args.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
