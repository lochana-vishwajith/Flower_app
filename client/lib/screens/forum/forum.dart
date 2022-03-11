import 'package:client/Components/card_component.dart';
import 'package:client/screens/forum/start_conversation.dart';
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(StartConversation.routeName);
          },
          backgroundColor: const Color.fromARGB(255, 50, 59, 190),
          splashColor: const Color.fromARGB(255, 116, 114, 214),
          hoverColor: const Color.fromARGB(255, 6, 24, 58),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 12,
          tooltip: 'Start Coversation',
          child: const Icon(Icons.add)),
    );
  }
}
