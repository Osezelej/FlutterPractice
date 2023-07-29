// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget? _animatedFarmName;
  Widget? _animatedFarmNunmber;
  Widget? _animatedFarmLocation;
  int i = 0;
  String _initialName = 'Art Template';
  String _initialNumber = '08076320300';
  String _iitialAddr = '20, Along Farm Rd, AtanOta, Ogun State, Nigeria.';
  @override
  Widget build(BuildContext context) {
    if (i == 0) {
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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Color.fromARGB(255, 255, 175, 75),
                    backgroundImage: AssetImage('agric_fresh.png'),
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
                          autofillHints: [
                            AutofillHints.givenName,
                            AutofillHints.username
                          ],
                          textCapitalization: TextCapitalization.words,
                          autofocus: true,
                          onChanged: (value) {
                            _initialName = value;
                          },
                          onEditingComplete: () {
                            setState(() {
                              _animatedFarmName = Text(
                                _initialName,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            });
                          },
                          controller: TextEditingController(text: _initialName),
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
                            _initialNumber = value;
                          },
                          onEditingComplete: () {
                            setState(() {
                              _animatedFarmNunmber = Text(
                                _initialNumber,
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
                            _iitialAddr = value;
                          },
                          onEditingComplete: () {
                            setState(() {
                              _animatedFarmLocation = Text(
                                _iitialAddr,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            });
                          },
                          controller: TextEditingController(text: _iitialAddr),
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
              onPressed: () {},
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
    );
  }
}
