// ignore_for_file: prefer_const_constructors

import 'package:agric_fresh_app/config.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:dio/dio.dart';
import 'package:agric_fresh_app/components/touchDailComp.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Profile extends StatefulWidget {
  final User_ appuser;
  const Profile({super.key, required this.appuser});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  Widget? _animatedFarmName;
  Widget? _animatedFarmNunmber;
  Widget? _animatedFarmLocation;
  int i = 0;
  String _initialName = 'Art Template';
  String _initialNumber = '08076320300';
  String _iitialAddr = '20, Along Farm Rd, AtanOta, Ogun State, Nigeria.';
  String? _Name;
  String? _Number;
  String? _addr;
  Widget _firstvalidComp = Placeholder();
  Widget _secondvalidComp = Placeholder();
  Widget _thirdvalidComp = Placeholder();
  Widget _fourthvalidComp = Placeholder();
  String value = '';
  final dio = Dio();
  String email = '';
  String code = '';
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
  updateUserProfile(
      User_ appuser, String number, String addr, String farm_name) async {
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
      final response = await dio.post(
        '$baseUrl/updateUserProfile',
        data: {
          'email': appuser.email,
          'farm_name': farm_name,
          'phone': number,
          'farm_address': addr,
        },
      );
      if (response.statusCode == 200) {
        Navigator.pop(context);
        if (response.data == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(
                      'Sorry, an error occured when updating your profile.'),
                );
              });
          await Future.delayed(Duration(milliseconds: 1000));
          Navigator.popAndPushNamed(context, '/');
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(
                      'Sorry, an error occured when updating your profile.'),
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Succefull'),
                  content:
                      Text('Your farm details have been updated successfully'),
                );
              });
        }
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Sorry, an error occured when updating your profile, Please try again later.'),
              );
            });
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'Sorry, an error occured when updating your profile, Please try again later'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    User_ appuser = widget.appuser;

    if (i == 0) {
      _initialName = appuser.farmName;
      _initialNumber = appuser.phoneNumber;
      _iitialAddr = appuser.pickUpaddr;
      _animatedFarmName = Text(
        _initialName,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      );

      _animatedFarmNunmber = Text(
        _initialNumber,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      );
      _animatedFarmLocation = Text(
        _iitialAddr,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    i++;
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
        if (value == appuser.trxPin) {
          await Future.delayed(Duration(milliseconds: 400));
          Navigator.of(context).pop();
          value = '';
          if (_Name != null || _Number != null || _addr != null) {
            updateUserProfile(
              appuser,
              _Number ?? _initialNumber,
              _addr ?? _iitialAddr,
              _Name ?? _initialName,
            );
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Warning'),
                    content: Text(
                        'No changes were made to your profile, make changes and try again.'),
                  );
                });
          }
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
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Stack(children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Color.fromARGB(255, 255, 175, 75),
                      backgroundImage: AssetImage('assets/agric_fresh.png'),
                    ),
                  ),
                  Positioned(
                      top: 13,
                      right: 19,
                      child: GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          print(result?.files.single.bytes);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 255, 175, 74)),
                          child: Icon(
                            Icons.edit_rounded,
                            size: 20,
                          ),
                        ),
                      ))
                ]),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    'Farm Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _animatedFarmName = TextField(
                            autofillHints: const [
                              AutofillHints.givenName,
                              AutofillHints.username
                            ],
                            textCapitalization: TextCapitalization.words,
                            autofocus: true,
                            onChanged: (value) {
                              _Name = value;
                            },
                            onEditingComplete: () {
                              setState(() {
                                _animatedFarmName = Text(
                                  _Name == null
                                      ? _initialName
                                      : _Name as String,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );
                              });
                            },
                            controller:
                                TextEditingController(text: _initialName),
                            decoration: InputDecoration(
                                labelText: 'Farm Name',
                                floatingLabelStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 175, 75),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 175, 75)),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          );
                        });
                      },
                      icon: Icon(
                        Icons.edit_rounded,
                        color: Color.fromARGB(255, 255, 175, 75),
                      ))
                ]),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: _animatedFarmName,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Text(
                    'Company/Farm phone number ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _animatedFarmNunmber = TextField(
                            autofocus: true,
                            onChanged: (value) {
                              _Number = value;
                            },
                            onEditingComplete: () {
                              setState(() {
                                _animatedFarmNunmber = Text(
                                  _Number == null
                                      ? _initialNumber
                                      : _Number as String,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );
                              });
                            },
                            controller:
                                TextEditingController(text: _initialNumber),
                            decoration: InputDecoration(
                                labelText: 'Company/phone number',
                                floatingLabelStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 175, 75),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 175, 75)),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          );
                        });
                      },
                      icon: Icon(
                        Icons.edit_rounded,
                        color: Color.fromARGB(255, 255, 175, 75),
                      ))
                ]),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: _animatedFarmNunmber,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Text(
                    'Farm Address/Pickup Location',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _animatedFarmLocation = TextField(
                            autofocus: true,
                            onChanged: (value) {
                              _addr = value;
                            },
                            onEditingComplete: () {
                              setState(() {
                                _animatedFarmLocation = Text(
                                  _addr == null ? _iitialAddr : _addr as String,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );
                              });
                            },
                            controller:
                                TextEditingController(text: _iitialAddr),
                            decoration: InputDecoration(
                                labelText: 'Farm Address',
                                floatingLabelStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 175, 75),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 175, 75)),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          );
                        });
                      },
                      icon: Icon(
                        Icons.edit_rounded,
                        color: Color.fromARGB(255, 255, 175, 75),
                      ))
                ]),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: _animatedFarmLocation,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(
                onPressed: () {
                  showmodal('profile');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 175, 75))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Apply Changes',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
