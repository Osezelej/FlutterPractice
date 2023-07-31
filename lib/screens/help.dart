// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
        title: Text(
          'Help-Contact us',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 130,
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/icon.png'),
                radius: 45,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Agric Fresh',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '.Store',
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: '08076320300'));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('phone number coppied!'),
                  elevation: 10,
                ));
              },
              onLongPress: () async {
                await Clipboard.setData(ClipboardData(text: '08076320300'));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('phone number coppied!'),
                  elevation: 10,
                ));
              },
              child: Card(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.copy_rounded,
                            color: Color.fromARGB(255, 255, 175, 75),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('08076320300')
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: '3osezelejoseph@gmail.com'));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Email coppied!'),
                  elevation: 10,
                ));
              },
              onLongPress: () async {
                await Clipboard.setData(
                    ClipboardData(text: '3osezelejoseph@gmail.com'));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Email coppied!'),
                  elevation: 10,
                ));
              },
              child: Card(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.copy_rounded,
                            color: Color.fromARGB(255, 255, 175, 75),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('3osezelejoseph@gmail.com')
                    ]),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
