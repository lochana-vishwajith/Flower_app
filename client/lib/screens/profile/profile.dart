import 'package:client/screens/profile/update_profile.dart';
import 'package:client/screens/profile/user_login.dart';
import 'package:client/screens/profile/user_profile.dart';
import 'package:client/screens/profile/user_register.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return const Center(
  //     child: Text('Profile'),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return UserProfile();
  }
}
