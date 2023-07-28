// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/transaction_historyComp.dart';
import 'package:agric_fresh_app/components/drawerComp.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  bool iconisPressed = false;
  List<Map<String, String>> transactionData = [
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    }
  ];

  @override
  Widget build(BuildContext context) {
    Icon icon = iconisPressed
        ? const Icon(Icons.remove_red_eye_outlined)
        : const Icon(Icons.remove_red_eye);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('icon.png'),
                ),
                title: Text(
                  'Art Template',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(children: const [
                Column(
                  children: [
                    DrawerItem(
                      leading: Icon(Icons.file_upload_rounded),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      text: 'Upload Product',
                      url: '/upload product',
                    ),
                    DrawerItem(
                        leading: Icon(Icons.wallet_rounded),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        text: 'Withdraw funds',
                        url: '/withdraw'),
                    DrawerItem(
                      leading: Icon(Icons.chat_bubble_rounded),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      text: 'Negotiations',
                      url: '/Negotiation',
                    ),
                    DrawerItem(
                      leading: Icon(Icons.pending),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      text: 'Pending uploads',
                      url: '/pendingUpload',
                    ),
                    DrawerItem(
                        leading: Icon(Icons.shopping_bag),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        text: 'Products',
                        url: '/uploadedProduct'),
                  ],
                ),
                Column(
                  children: [
                    DrawerItem(
                        text: 'Profile',
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.supervised_user_circle_rounded),
                        url: '/profile'),
                    DrawerItem(
                      text: 'Help - Contact Us',
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(Icons.help_center),
                    ),
                    DrawerItem(
                      text: 'Logout',
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(Icons.logout),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              centerTitle: false,
              title: const Text(
                'Transactions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              iconTheme: const IconThemeData(color: Color(0xffffaf36)),
              backgroundColor: Colors.white,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 130,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 175, 54),
                          Color.fromARGB(255, 255, 175, 74),
                          Color.fromARGB(255, 255, 175, 74),
                          Color.fromARGB(255, 255, 175, 74),
                          Color.fromARGB(255, 255, 175, 74),
                          Color.fromARGB(255, 255, 255, 255),
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(2.3)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 5),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'naira.png',
                                  width: 30,
                                  height: 30,
                                  cacheHeight: 30,
                                  cacheWidth: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '0.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Farm Name:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      'Agric Fresh',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Email:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.5,
                                      ),
                                    ),
                                    Text(
                                      '2osezelejoseph@gmail.com',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                iconisPressed = iconisPressed ? false : true;
                              });
                            },
                            icon: icon)
                      ],
                    ),
                  ),
                ),
              )),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: transactionData.length,
                      (BuildContext context, int index) {
            return TransactionHistoryItem(
              status: transactionData[index]['status'],
              time: transactionData[index]['time'],
              date: transactionData[index]['date'],
              amount: transactionData[index]['amount'],
            );
          }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 255, 125, 54),
        elevation: 5,
        child: Icon(
          Icons.file_upload_rounded,
          weight: 50.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
