// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class SignUp extends StatefulWidget {
  final SupabaseClient supabase;
  const SignUp({super.key, required this.supabase});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  final ImagePicker _imagePicker = ImagePicker();
  late AnimationController _animationController;
  Widget _firstValidComp = Placeholder();
  Widget _secondValidComp = Placeholder();
  Widget _thirdValidComp = Placeholder();
  Widget _fourthValidComp = Placeholder();
  Widget _fifthValidComp = Placeholder();
  final List<Map<String, dynamic>> validComptext = [
    {
      'text': '1 Capital letter',
      'isActive': false,
    },
    {
      'text': '1 Small letter',
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
      'text': '8 characters Length',
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
  late AnimationController _controller;
  Widget _seeButton = Placeholder();
  bool isSeen = true;
  final uuid = Uuid();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  bool _visibleButton = false;

  int i = 0;
  String farm_name = '';
  String farm_owner = '';
  String email = '';
  String phone = '';
  String address = '';
  String trx_pin = '';
  String password = '';
  String c_password = '';
  bool isImageSelected = false;
  final dio = Dio();
  late XFile? image;
  String imageName = '';
  final imageSinal = createSignal('Select a profile picture(optional)');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    imageSinal.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var supabase = widget.supabase;

    uploadimgae(image) async {
      try {
        supabase.storage
            .from('images')
            .uploadBinary('farmersImage/$imageName', await image.readAsBytes(),
                fileOptions: FileOptions(
                  upsert: true,
                ),
                retryAttempts: 1)
            .then((value) => print(value));
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('An error occured try again'),
              );
            });
      }
    }

    handleProfile() async {
      image = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imageName = uuid.v4() + image!.name;
        imageSinal.set(image!.name);
        isImageSelected = true;
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Warning'),
                content: Text('No Image was selected'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              );
            });
      }
    }

    handleClick() async {
      int isDone = 0;
      if (isImageSelected) {
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
                        Text('Uploading Image...')
                      ],
                    ),
                  ),
                ));
        await Future.delayed(Duration(milliseconds: 1000));
        await uploadimgae(image).catchError((e) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('there was an error try again.'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'))
                  ],
                );
              });
        }).then((value) => Navigator.pop(context));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Warning'),
                content: Text('No Image was selected'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              );
            });
      }
      if ((password == c_password) &&
          farm_name.isNotEmpty &&
          farm_owner.isNotEmpty &&
          (email.isNotEmpty &&
              email.contains('@') &&
              email.toLowerCase().contains('.com')) &&
          trx_pin.isNotEmpty &&
          trx_pin.length == 4 &&
          address.isNotEmpty &&
          password.isNotEmpty &&
          c_password.isNotEmpty &&
          phone.isNotEmpty) {
        var Signup = {
          'farm_name': farm_name.trim(),
          'owner_name': farm_owner.trim(),
          'email': email.trim(),
          'phone': phone.trim(),
          'farm_address': address.trim(),
          'transaction_pin': trx_pin.trim(),
          'password': password.trim(),
          'image_name': imageName.isNotEmpty ? imageName : null
        };
        print(imageName);
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
                        Text('Signing in')
                      ],
                    ),
                  ),
                ));
        await Future.delayed(Duration(milliseconds: 1000));
        try {
          Response response =
              await dio.post('$baseUrl/signup', data: Signup).then((value) {
            Navigator.pop(context);
            return value;
          });

          if (response.data == 'unsuccessfull') {
            () async {
              await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        elevation: 24,
                        title: Text('Error'),
                        content: Text(
                            'Email have been used already! check your email and try again.'),
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
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      elevation: 24,
                      title: Text('SIGNED UP SUCESSFULLY!!'),
                      content: Text(
                          'You have successfully registered as a partner with Agric Fresh, your account will be reviewed. you can now start uploading product to your account and earning!.'),
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
          await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    elevation: 24,
                    title: Text('Error'),
                    content: Text('Network'),
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

    if (i == 0) {
      _seeButton = Icon(
        key: ValueKey('sec'),
        Icons.remove_red_eye_outlined,
      );
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
        validComptext[4]['isActive'] = true;
        setState(() {
          _fifthValidComp = Container(
              width: 170,
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
        validComptext[4]['isActive'] = false;
        setState(() {
          _fifthValidComp = Container(
            width: 165,
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
        validComptext[0]['isActive'] = false;
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
            width: 150,
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

        validComptext[1]['isActive'] = false;
      }

      if (isChar) {
        setState(() {
          _thirdValidComp = Container(
              width: 165,
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
            width: 165,
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

        validComptext[2]['isActive'] = false;
      }
      if (isnum) {
        setState(() {
          _fourthValidComp = Container(
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
                  Text(validComptext[3]['text']),
                ],
              ));
        });
      } else {
        setState(() {
          _fourthValidComp = Container(
            width: 150,
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

        validComptext[3]['isActive'] = false;
      }

      if (validComptext[0]['isActive'] &&
          validComptext[1]['isActive'] &&
          validComptext[2]['isActive'] &&
          validComptext[3]['isActive'] &&
          validComptext[4]['isActive']) {
        setState(() {
          _visibleButton = true;
        });
        password = value;
        _controller.forward();
      } else {
        _controller.reverse();
        if (_controller.isDismissed) {
          setState(() {
            _visibleButton = false;
          });
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              autofocus: true,
              autofillHints: const [AutofillHints.familyName],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 131, 131, 131))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 175, 75))),
                  labelText: 'Farm name',
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 175, 75),
                  )),
              onChanged: (value) {
                farm_name = value;
              },
              onEditingComplete: () {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              autofocus: true,
              autofillHints: const [
                AutofillHints.givenName,
                AutofillHints.creditCardName,
                AutofillHints.name
              ],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 131, 131, 131))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 175, 75))),
                  labelText: 'Farm owner name',
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 175, 75),
                  )),
              onChanged: (value) {
                farm_owner = value;
              },
              onEditingComplete: () {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              autofillHints: const [AutofillHints.email],
              decoration: InputDecoration(
                  hintText: 'Enter a valid email',
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
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              autofocus: true,
              autofillHints: const [AutofillHints.telephoneNumber],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 131, 131, 131))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 175, 75))),
                  labelText: 'Phone number',
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 175, 75),
                  )),
              onChanged: (value) {
                phone = value;
              },
              onEditingComplete: () {},
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              autofocus: true,
              autofillHints: const [AutofillHints.addressCityAndState],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 131, 131, 131))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 175, 75))),
                  labelText: 'Farm address/ Pickup location',
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 175, 75),
                  )),
              onChanged: (value) {
                address = value;
              },
              onEditingComplete: () {},
              maxLines: 3,
            ),
            SizedBox(
              height: 10,
            ),
            DottedBorder(
                dashPattern: const [16, 7],
                color: Color.fromARGB(255, 255, 175, 75),
                child: SignalBuilder(
                  signal: imageSinal,
                  builder: (context, imagesignal, child) {
                    return Container(
                      height: 130,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Column(children: [
                          IconButton(
                              onPressed: () {
                                handleProfile();
                              },
                              icon: Icon(Icons.camera_alt)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            imagesignal,
                            style: TextStyle(fontSize: 16),
                          ),
                        ]),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
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
                  labelText: 'Transaction Pin',
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 175, 75),
                  )),
              onChanged: (value) {
                trx_pin = value;
              },
              onEditingComplete: () {},
              maxLength: 4,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    obscureText: isSeen,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 131, 131, 131))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 255, 175, 75))),
                        labelText: 'Password',
                        floatingLabelStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 175, 75),
                        )),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _animationController.forward();
                          _setVisibility = true;
                        });

                        handleChange(value);
                      } else {
                        handleChange(value);
                      }
                    },
                    onEditingComplete: () {},
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      if (isSeen) {
                        setState(() {
                          isSeen = false;
                          _seeButton = Icon(
                            key: ValueKey('first'),
                            Icons.remove_red_eye_rounded,
                            color: Color.fromARGB(255, 255, 175, 75),
                          );
                        });
                      } else {
                        isSeen = true;
                        setState(() {
                          setState(() {
                            _seeButton = Icon(
                              key: ValueKey('sec'),
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                            );
                          });
                        });
                      }
                    },
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: _seeButton,
                    )),
              ],
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
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
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
                  labelText: 'Confirm PassWord',
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 175, 75),
                  )),
              onChanged: (value) {
                c_password = value;
              },
              onEditingComplete: () {},
            ),
            SizedBox(
              height: 30,
            ),
            FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(_controller),
              child: Visibility(
                visible: _visibleButton,
                child: TextButton.icon(
                  onPressed: () {
                    handleClick().then((value) {
                      Navigator.pop(context);
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
