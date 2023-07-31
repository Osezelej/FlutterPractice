// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResetPswrd extends StatefulWidget {
  const ResetPswrd({super.key});

  @override
  State<ResetPswrd> createState() => _ResetPswrdState();
}

class _ResetPswrdState extends State<ResetPswrd> with TickerProviderStateMixin {
  late AnimationController _animationController;
  Widget _firstValidComp = Placeholder();
  Widget _secondValidComp = Placeholder();
  Widget _thirdValidComp = Placeholder();
  Widget _fourthValidComp = Placeholder();
  Widget _fifthValidComp = Placeholder();
  final List<Map<String, dynamic>> validComptext = [
    {
      'text': '1 Uppercase alphabet',
      'isActive': false,
    },
    {
      'text': '1 LowerCase alphabet',
      'isActive': false,
    },
    {
      'text': '1 Special character',
      'isActive': false,
    },
    {
      'text': '1 Number',
      'isActive': false,
    },
    {
      'text': '8 character Length',
      'isActive': false,
    },
  ];
  bool _setVisibility = false;
  final List capAlpha = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
  final List smlAlpha = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  final List num = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ];
  final List char = [
    '`',
    '!',
    '@',
    '#',
    '\$',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    '_',
    '-',
    '+',
    '=',
    '{',
    ':',
    ';',
    '"',
    "'",
    '>',
    ',',
    '<',
    '.',
    '/',
    '\\',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      _firstValidComp = Container(
        key: ValueKey('first'),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
        ),
        child: Text(validComptext[0]['text']),
      );
      _secondValidComp = Container(
        key: ValueKey('first'),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
        ),
        child: Text(validComptext[1]['text']),
      );
      _thirdValidComp = Container(
        key: ValueKey('first'),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
        ),
        child: Text(validComptext[2]['text']),
      );
      _fourthValidComp = Container(
        key: ValueKey('first'),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
        ),
        child: Text(validComptext[3]['text']),
      );
      _fifthValidComp = Container(
        key: ValueKey('first'),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
        ),
        child: Text(validComptext[4]['text']),
      );
    }
    i++;
    void handleChange(String value) {
      bool isAlpha = false;
      bool isSmall = false;
      bool isChar = false;
      bool isnum = false;
      if (value.length >= 8) {
        setState(() {
          _fifthValidComp = Container(
              key: ValueKey('first'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 175, 75),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(validComptext[4]['text']),
                ],
              ));
        });
      } else {
        setState(() {
          _fifthValidComp = Container(
            key: ValueKey('first'),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
            ),
            child: Text(validComptext[4]['text']),
          );
        });
      }
      for (var i in capAlpha) {
        if (value.contains(i)) {
          isAlpha = true;
          validComptext[0]['isActive'] = true;
        }
      }
      for (var i in smlAlpha) {
        if (value.contains(i)) {
          isSmall = true;
          validComptext[1]['isActive'] = true;
        }
      }
      for (var i in num) {
        if (value.contains(i)) {
          isnum = true;
          validComptext[3]['isActive'] = true;
        }
      }
      for (var i in char) {
        if (value.contains(i)) {
          isChar = true;
          validComptext[2]['isActive'] = true;
        }
      }

      if (isAlpha) {
        setState(() {
          _firstValidComp = Container(
              width: 150,
              key: ValueKey('sec'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 175, 75),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(validComptext[0]['text']),
                ],
              ));
        });
      } else {
        setState(() {
          _firstValidComp = Container(
            width: 150,
            key: ValueKey('first'),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
            ),
            child: Text(validComptext[0]['text']),
          );
        });
      }

      if (isSmall) {
        setState(() {
          _secondValidComp = Container(
              width: 150,
              key: ValueKey('sec'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 175, 75),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(validComptext[1]['text']),
                ],
              ));
        });
      } else {
        setState(() {
          _secondValidComp = Container(
            key: ValueKey('first'),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
            ),
            child: Text(validComptext[1]['text']),
          );
        });
      }

      if (isChar) {
        setState(() {
          _thirdValidComp = Container(
              key: ValueKey('sec'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 175, 75),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(validComptext[2]['text']),
                ],
              ));
        });
      } else {
        setState(() {
          _thirdValidComp = Container(
            key: ValueKey('first'),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
            ),
            child: Text(validComptext[2]['text']),
          );
        });
      }
      if (isnum) {
        setState(() {
          _fourthValidComp = Container(
              key: ValueKey('sec'),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 175, 75),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(validComptext[3]['text']),
                ],
              ));
        });
      } else {
        setState(() {
          _fourthValidComp = Container(
            key: ValueKey('first'),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color.fromARGB(255, 255, 175, 75)),
            ),
            child: Text(validComptext[3]['text']),
          );
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
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
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 17,
            ),
            Container(
              child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 131, 131, 131))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 255, 175, 75))),
                    labelText: 'New Password',
                    floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 175, 75),
                    )),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      _animationController.forward();
                      _setVisibility = true;
                      handleChange(value);
                    });
                  } else {
                    setState(() {
                      _animationController.reverse();

                      if (_animationController.isDismissed) {
                        _setVisibility = false;
                      }
                    });
                  }
                },
                onEditingComplete: () {},
              ),
            ),
            SizedBox(height: 10),
            FadeTransition(
              opacity:
                  Tween<double>(begin: 0, end: 1).animate(_animationController),
              child: Visibility(
                  visible: _setVisibility,
                  child: Container(
                    child: Wrap(spacing: 10, runSpacing: 5, children: [
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: _firstValidComp),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: _secondValidComp),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: _thirdValidComp),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: _fourthValidComp),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: _fifthValidComp),
                    ]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
