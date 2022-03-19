import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Update Profile"),
      //   backgroundColor: Colors.green,
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter bio and mobile to update",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // TextField(
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       focusedBorder: new OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.green),
            //       ),
            //       labelText: 'User Name',
            //       hintText: 'Enter the username'),
            // ),
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
                  onPressed: () {},
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
    );
  }
}
