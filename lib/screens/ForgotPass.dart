// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:agric_fresh_app/config.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/touchDailComp.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForgotPswrd extends StatefulWidget {
  final User_ appuser;
  const ForgotPswrd({super.key, required this.appuser});

  @override
  State<ForgotPswrd> createState() => _ForgotPswrdState();
}

class _ForgotPswrdState extends State<ForgotPswrd>
    with TickerProviderStateMixin {
  List<String> touchDail = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];

  Widget _firstvalidComp = Placeholder();
  Widget _secondvalidComp = Placeholder();
  Widget _thirdvalidComp = Placeholder();
  Widget _fourthvalidComp = Placeholder();
  int i = 0;

  String value = '';
  final dio = Dio();
  String email = '';
  String code = '';
  @override
  Widget build(BuildContext context) {
    final User_ appuser = widget.appuser;
    getconfirmation() async {
      bool isSuccessful = false;
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
                      Text('Getting code...')
                    ],
                  ),
                ),
              ));
      await Future.delayed(Duration(milliseconds: 1000));
      try {
        await dio.get('$baseUrl/password', queryParameters: {
          'email': email,
        }).then((value) {
          isSuccessful = true;
          print(value.data);
          code = value.data['code'].toString().substring(0, 4);

          Navigator.pop(context);
        });
      } catch (e) {
        print(e);
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('sorry, An error occured try again later.'),
              );
            });
      }
      return isSuccessful;
    }

    handleForget() async {
      bool isSuccessful = false;
      if (!email.contains('@')) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('@ missing in your email enter a valid email.'),
              );
            });
        return 0;
      }
      if (!email.contains('.com', email.indexOf('@'))) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Enter a valid email.'),
              );
            });
        return 0;
      }
      if (email.isNotEmpty) {
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
                        Text('Confirming email...')
                      ],
                    ),
                  ),
                ));
        await Future.delayed(Duration(milliseconds: 1000));
        try {
          await dio.get(
            "$baseUrl/forgetPassword",
            queryParameters: {'email': email},
          ).then((value) {
            if (value.data == 0) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Incorrect email'),
                      content: Text(
                          'The email you entered is incorrect, Please check your email and try again'),
                    );
                  });
            } else {
              print(value);
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Email confirmed'),
                    );
                  });
              isSuccessful = true;
            }

            return value;
          });
        } catch (e) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('An error occured try again later.'),
                );
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Enter a valid email.'),
              );
            });
      }
      return isSuccessful;
    }

    void addFunction(String e, BuildContext context, StateSetter modalsetState,
        String from) async {
      value += e;
      print(value);
      if (value.length == 1) {
        modalsetState(() {
          _firstvalidComp = Container(
            key: const ValueKey('sec'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Color.fromARGB(255, 255, 175, 74),
              borderRadius: BorderRadius.circular(40),
            ),
          );
        });
      }
      if (value.length == 2) {
        modalsetState(() {
          _secondvalidComp = Container(
            key: const ValueKey('sec'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Color.fromARGB(255, 255, 175, 74),
              borderRadius: BorderRadius.circular(40),
            ),
          );
        });
      }
      if (value.length == 3) {
        modalsetState(() {
          _thirdvalidComp = Container(
            key: const ValueKey('sec'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Color.fromARGB(255, 255, 175, 74),
              borderRadius: BorderRadius.circular(40),
            ),
          );
        });
      }
      if (value.length == 4) {
        modalsetState(() {
          _fourthvalidComp = Container(
            key: const ValueKey('sec'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Color.fromARGB(255, 255, 175, 74),
              borderRadius: BorderRadius.circular(40),
            ),
          );
        });
        if (value == code) {
          await Future.delayed(Duration(milliseconds: 400));
          Navigator.of(context).pop();
          value = '';
          appuser.email = email;
          Navigator.pushNamed(context, '/resetPassword');
        } else {
          Navigator.of(context).pop();
          value = '';
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Pin Error'),
                  content: Text('The pin entered is incorrect. try again!'),
                );
              });
        }
      }
    }

    void showmodal(from) async {
      _firstvalidComp = Container(
        key: const ValueKey('1'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );
      _secondvalidComp = Container(
        key: const ValueKey('2'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );

      _thirdvalidComp = Container(
        key: const ValueKey('3'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );

      _fourthvalidComp = Container(
        key: const ValueKey('4'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );

      await showModalBottomSheet(
        transitionAnimationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter modalSetState) {
            return Container(
              height: 380,
              color: Colors.white,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _firstvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _secondvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _thirdvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _fourthvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Enter Confirmation password'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(0, 3)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(3, 6)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(6, 9)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(9)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
              ]),
            );
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: ListView(
          children: [
            Text(
              'Please Enter your email. you will recieve a link to create a new password Via email.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                autofillHints: const [AutofillHints.username],
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
                  email = value;
                },
                onEditingComplete: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                handleForget().then((value) {
                  if (value == true) {
                    Navigator.of(context).pop();
                    getconfirmation().then((value) {
                      if (value == true) {
                        print(code);
                        showmodal('forgetpassword');
                      }
                    });
                  }
                });
              },
              child: Text(
                'submit',
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
          ],
        ),
      ),
    );
  }
}
