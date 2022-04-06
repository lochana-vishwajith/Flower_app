import 'package:client/Providers/flower_item_provider.dart';
import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/screens/admin/admin_home.dart';
import 'package:client/screens/admin/flowerAdd.dart';
import 'package:client/screens/admin/flowerEntry.dart';
import 'package:client/screens/admin/flowerUpdate.dart';
import 'package:client/screens/diary/diary.dart';
import 'package:client/screens/forum/my_posts.dart';
import 'package:client/screens/forum/start_conversation.dart';
import 'package:client/screens/admin/flowerList.dart';
import 'package:client/screens/forum/update_forum-question.dart';
import 'package:client/screens/forum/viewQuestion.dart';
import 'package:client/screens/home.dart';
import 'package:client/screens/profile/user_login.dart';
import 'package:client/screens/search/flowerView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/screens/diary/diary_Add.dart';
import 'package:client/Providers/diary_item_provider.dart';
import 'package:client/screens/diary/diary_Item.dart';
import 'package:client/screens/diary/diary_List.dart';
import 'package:client/screens/diary/diary_Update.dart';
import 'package:client/screens/diary/diary.dart';


void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ForumItemProvider()),
      ChangeNotifierProvider(create: (_) => FlowerItemProvider()),
      ChangeNotifierProvider(create: (_) => DiaryItemProvider())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flower App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        secondaryHeaderColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 255, 222),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const Home(),
        '/adminList': (context) => const FlowerList(),
        '/adminAdd': (context) => const FlowerAdd(),
        StartConversation.routeName: (context) => const StartConversation(),
        '/adminEdit': (context) => const FlowerAdd(),
        ViewQuestions.routeName: ((context) => const ViewQuestions()),
        MyPosts.routeName: ((context) => const MyPosts()),
        FlowerView.routeName: ((context) => const FlowerView()),
        '/adminHome': (context) => const AdminHome(),
        UpdateForum.routeName: ((context) => const UpdateForum()),
        FlowerUpdate.routeName: ((context) => const FlowerUpdate()),
        CreateDiary.routeName: (context) => const CreateDiary(),
        LoginPage.routeName: ((context) => const LoginPage()),
        ViewDiary.routeName:(context) => const ViewDiary(),
        MyDiaries.routeName:(context)=>const  MyDiaries(),
        UpdateDiary.routeName:(context) =>const UpdateDiary(),
        Diary.routeName:(context)=>const Diary()


      },
    );
  }
}
