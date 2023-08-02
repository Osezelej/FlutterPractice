// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginIn extends StatelessWidget {
  final FocusNode _focusNodeUsername = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  LoginIn({super.key});
  @override
  Widget build(BuildContext context) {
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
                    labelText: 'Username',
                    floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 175, 75),
                    )),
                onChanged: (value) {},
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
                onChanged: (value) {},
                onEditingComplete: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/transaction');
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
