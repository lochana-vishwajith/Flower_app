import 'package:client/Providers/user_provider.dart';
import 'package:client/models/user_model.dart';
import 'package:client/screens/profile/user_profile_test.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UserModel? _userModel;
  TextEditingController bioController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  UserProvider provider = UserProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter bio and mobile to update",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Card(
                  //color: Colors.grey,
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),

                      //labelText: 'Bio',
                      hintText: 'Enter the Bio'),
                  controller: bioController,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Card(
                  //color: Colors.grey,
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      //labelText: 'Bio',
                      hintText: 'Enter the Mobile Number'),
                  controller: mobileController,
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async {
                      String bio = bioController.text;
                      String mobile = mobileController.text;

                      try {
                        await provider.updateUser(bio, mobile);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Update Successfully'),
                            duration: Duration(milliseconds: 1000),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileTest()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Update Failed'),
                            duration: Duration(milliseconds: 1000),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Update Details',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
