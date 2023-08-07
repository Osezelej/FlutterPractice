// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config.dart';
import '../main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class LoginIn extends StatelessWidget {
  final SupabaseClient supabase;
  final User_ appuser;
  final FocusNode _focusNodePassword = FocusNode();
  String username = '';
  String password = '';
  LoginIn({super.key, required this.supabase, required this.appuser});
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    loginUser() async {
      int isDone = 0;
      Map<String, String> logindata;

      if (username.isNotEmpty && password.isNotEmpty) {
        logindata = {'email': username.trim(), 'password': password.trim()};

        showDialog(
            context: context,
            builder: (builder) => AlertDialog(
                  elevation: 24,
                  backgroundColor: Colors.white,
                  content: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        SpinKitDualRing(
                          size: 30,
                          lineWidth: 3.0,
                          color: Color.fromARGB(255, 255, 175, 75),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Loging in...')
                      ],
                    ),
                  ),
                ));
        await Future.delayed(Duration(milliseconds: 1000));
        try {
          var response = await dio.post(
            '$baseUrl/login',
            data: logindata,
          );
          print(response);

          if (response.data == 0) {
            Navigator.pop(context);
            () async {
              await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        elevation: 24,
                        title: Text('Error'),
                        content: Text('wrong email or password'),
                        backgroundColor: Colors.white,
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ],
                      ));
            }();
          } else {
            appuser.id = response.data["id"];
            appuser.email = response.data['email'];
            appuser.farmName = response.data["farm name"];
            appuser.farmOwnerName = response.data["farm owner name"];
            appuser.pickUpaddr = response.data["pickup address"];
            appuser.trxPin = response.data["transaction pin"];
            appuser.imageUrl = response.data["image url"];
            appuser.phoneNumber = response.data["phone number"];
            Navigator.pop(context);
            print(appuser.email);
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      elevation: 24,
                      title: Text(
                          'Login Success, Welcome Back ${appuser.farmOwnerName}'),
                      content: Text(''),
                      backgroundColor: Colors.white,
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'))
                      ],
                    ));
            isDone = 1;
          }
        } catch (e) {
          Navigator.pop(context);
          await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    elevation: 24,
                    title: Text('Error'),
                    content: Text('Network error.'),
                    backgroundColor: Colors.white,
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'))
                    ],
                  ));
        }
      } else {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  elevation: 24,
                  title: Text('Error'),
                  content: Text('Please fill in the correct details '),
                  backgroundColor: Colors.white,
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'))
                  ],
                ));
      }
      return isDone;
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 175, 75),
                    backgroundImage: AssetImage('assets/icon.png'),
                    radius: 55,
                  ),
                  Text(
                    '.Shop',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 39,
            ),
            Container(
              child: TextField(
                focusNode: FocusNode(),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                autofocus: true,
                autofillHints: [AutofillHints.username],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 131, 131, 131))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 255, 175, 75))),
                    labelText: 'Email',
                    floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 175, 75),
                    )),
                onChanged: (value) {
                  username = value;
                },
                onEditingComplete: () {
                  _focusNodePassword.requestFocus();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                focusNode: _focusNodePassword,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.username],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 131, 131, 131))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 255, 175, 75))),
                    labelText: 'Password',
                    floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 175, 75),
                    )),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                onEditingComplete: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {
                loginUser().then((value) {
                  if (value == 1) {
                    Navigator.pushNamed(context, '/transaction');
                  }
                });
              },
              icon: Icon(
                Icons.arrow_forward_rounded,
                size: 20,
              ),
              label: Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 175, 54)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)),
            ),
            SizedBox(
              height: 7,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgotPassword');
              },
              child: Center(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              icon: Icon(
                Icons.arrow_forward_rounded,
                size: 20,
              ),
              label: Text(
                'Signup',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 220, 220, 220)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)),
            ),
          ]),
        ),
      ),
    );
  }
}
