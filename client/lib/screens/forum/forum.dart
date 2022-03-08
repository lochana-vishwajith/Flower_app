import 'package:client/Components/card_component.dart';
import 'package:flutter/material.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: ListView(children: const [
          CardComponent(
            title: "My Flower Problems",
          ),
          CardComponent(
            title: "My Flower Problems",
          ),
        ]),
      ),
      floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Color.fromARGB(255, 50, 59, 190),
          splashColor: Color.fromARGB(255, 116, 114, 214),
          hoverColor: Color.fromARGB(255, 6, 24, 58),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 12,
          tooltip: 'Start Coversation',
          child: Icon(Icons.add)),
    );
  }
}
