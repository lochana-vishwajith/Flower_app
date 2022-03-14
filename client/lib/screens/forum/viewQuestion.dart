import 'package:flutter/material.dart';

class ViewQuestions extends StatelessWidget {
  static const String routeName = '/viewquestion';

  const ViewQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Question"),
      ),
    );
  }
}
