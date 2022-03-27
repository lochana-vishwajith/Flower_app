import 'dart:ffi';

import 'package:client/Providers/user_provider.dart';
import 'package:client/models/user_model.dart';
import 'package:client/screens/profile/update_profile.dart';
import 'package:client/screens/profile/user_login.dart';
import 'package:flutter/material.dart';

class UserProfileTest extends StatefulWidget {
  const UserProfileTest({Key? key}) : super(key: key);

  @override
  State<UserProfileTest> createState() => _UserProfileTestState();
}

class _UserProfileTestState extends State<UserProfileTest> {
  UserModel? _userModel;
  UserProvider provider = UserProvider();
  @override
  void initState() {
    super.initState();
    // UserProvider provider = UserProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: FutureBuilder<List<UserModel>>(
            future: provider.fetchUser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Signout Successfully'),
                                  duration: Duration(milliseconds: 1000),
                                ),
                              );
                            },
                            icon: Icon(Icons.logout),
                            color: Colors.green,
                          )
                        ],
                      ),
                      Center(
                        child: CircleAvatar(
                          //backgroundImage: AssetImage('assets/pp.png'),
                          backgroundColor: Colors.amber,
                          radius: 60.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Username - ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data[0].username!,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bio - ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data[0].bio!,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Email - ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data[0].email!,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Contact Number - ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data[0].mobile!,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'My Posts',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'My Diaries',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateProfile()));
                              },
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () async {
                                try {
                                  await provider.deleteUser();
                                  print("deletebutton onpress");

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Deleted Successfully'),
                                      duration: Duration(milliseconds: 1000),
                                    ),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.toString()),
                                      duration: Duration(milliseconds: 1000),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Delete Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
