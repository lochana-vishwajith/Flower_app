import 'package:client/models/user_model.dart';
import 'package:client/screens/profile/update_profile.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
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
                      color: Colors.grey, fontSize: 18.0, letterSpacing: 1.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "ushara0921",
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
                      color: Colors.grey, fontSize: 18.0, letterSpacing: 1.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Hi i am thimal ushara. i like to learn about flowers",
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
                      color: Colors.grey, fontSize: 18.0, letterSpacing: 1.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "thimal@gmail.com",
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
                      color: Colors.grey, fontSize: 18.0, letterSpacing: 1.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "0783456789",
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
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                        onPressed: () {},
                        child: Text(
                          'Delete Profile',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
