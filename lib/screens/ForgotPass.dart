// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/touchDailComp.dart';

class ForgotPswrd extends StatefulWidget {
  const ForgotPswrd({super.key});

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
  @override
  Widget build(BuildContext context) {
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
        await Future.delayed(Duration(milliseconds: 400), () {
          Navigator.of(context).pop();
          value = '';
        });
        Navigator.pushNamed(context, '/resetPassword');
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
                onChanged: (value) {},
                onEditingComplete: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                showmodal('forgetpassword');
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
