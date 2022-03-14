import 'package:client/Providers/flower_item_provider.dart';
import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/screens/admin/flowerAdd.dart';
import 'package:client/screens/admin/flowerEntry.dart';
import 'package:client/screens/forum/start_conversation.dart';
import 'package:client/screens/admin/flowerList.dart';
import 'package:client/screens/forum/viewQuestion.dart';
import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ForumItemProvider()),
      ChangeNotifierProvider(create: (_) => FlowerItemProvider())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        secondaryHeaderColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 255, 222),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/adminList': (context) => const FlowerList(),
        '/adminAdd': (context) => const FlowerAdd(),
        StartConversation.routeName: (context) => const StartConversation(),
        '/adminEdit': (context) => const FlowerAdd(),
        ViewQuestions.routeName: ((context) => const ViewQuestions()),
      },
    );
  }
}
