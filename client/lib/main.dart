import 'package:client/screens/admin/flowerEntry.dart';
import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        secondaryHeaderColor: Colors.white,
        scaffoldBackgroundColor: Color.fromARGB(255, 254, 255, 222),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/adminAdd': (context) => const FlowerEntry(),
      },
    );
  }
}
