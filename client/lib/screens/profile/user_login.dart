import 'package:client/Providers/user_provider.dart';
import 'package:client/models/user_model.dart';
import 'package:client/screens/home.dart';
import 'package:client/screens/profile/user_profile_test.dart';
import 'package:client/screens/profile/user_register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserModel? _userModel;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProvider provider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Enter username and password to signin",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: new OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    labelText: 'User Name',
                    hintText: 'Enter the username'),
                controller: usernameController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: new OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter the password'),
                controller: passwordController,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    "Don't have a account ?",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserRegister()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;

                      // UserModel data = await provider.registerUser(
                      //     username, password, email);

                      provider.loginUser(username, password).then((value) {
                        setState(() {
                          _userModel = value;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Successfully'),
                            duration: Duration(milliseconds: 1000),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      }).catchError((e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Failed'),
                            duration: Duration(milliseconds: 1000),
                          ),
                        );
                      });
                    },
                    child: const Text(
                      'Sign In',
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
