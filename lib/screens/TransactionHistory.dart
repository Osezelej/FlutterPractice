// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/transaction_historyComp.dart';
import 'package:agric_fresh_app/components/drawerComp.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:agric_fresh_app/config.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:solidart/solidart.dart';
import 'package:dio/dio.dart';

class TransactionHistory extends StatefulWidget {
  final User_ appuser;
  const TransactionHistory({super.key, required this.appuser});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  bool iconisPressed = false;
  List transactionData = [];
  // resource
  late final Resource trxData;
  final Dio dio = Dio();
  bool isEmpty = false;
  fetchData(User_ appuser, BuildContext context, StateSetter setState) async {
    var response = await dio.get('$baseUrl/transactions',
        queryParameters: {'email': appuser.email});

    if (response.statusCode == 200) {
      if (response.data != 0) {
        setState(() {
          transactionData = response.data;
          appuser.transactionData = response.data;
        });
        print(transactionData);
      } else {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Network error'),
                content: Text('sorry! an error occured please try again later'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/');
                      },
                      child: Text('OK'))
                ],
              );
            });
      }
    } else {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Network error'),
              content: Text('sorry! an error occured please try again later'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/');
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    final User_ appuser = widget.appuser;
    if (i == 0) {
      fetchData(appuser, context, setState);
    }
    i++;

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
                  backgroundImage: appuser.imageUrl != null
                      ? NetworkImage('${ImagebaseUrl}/${appuser.imageUrl}')
                      : AssetImage('assets/icon.png') as ImageProvider,
                ),
                title: Text(
                  appuser.farmName,
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
                      url: '/help',
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
      body: RefreshIndicator(
        color: Color.fromARGB(255, 255, 175, 75),
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 400));
        },
        child: CustomScrollView(
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
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                iconTheme: const IconThemeData(color: Color(0xffffaf36)),
                backgroundColor: Colors.white,
                expandedHeight: 240.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 16),
                          height: 130,
                          margin: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 255, 175, 54),
                                Color.fromARGB(255, 255, 175, 74),
                                Color.fromARGB(255, 255, 175, 74),
                                Color.fromARGB(255, 255, 175, 74),
                                Color.fromARGB(255, 255, 175, 74),
                                Color.fromARGB(255, 255, 255, 255),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.3)),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/naira.png',
                                        width: 30,
                                        height: 30,
                                        cacheHeight: 30,
                                        cacheWidth: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        appuser.acctBal,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            appuser.farmName,
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
                                            appuser.email,
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
                                      iconisPressed =
                                          iconisPressed ? false : true;
                                    });
                                  },
                                  icon: icon)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount:
                        transactionData.isEmpty ? 1 : transactionData.length,
                    (BuildContext context, int index) {
              return transactionData.isEmpty
                  ? ListTile(
                      title: Text('There is no transaction available yet'),
                    )
                  : TransactionHistoryItem(
                      name: transactionData[index]['name'] as String,
                      status: transactionData[index]['status'],
                      time: transactionData[index]['time'],
                      date: transactionData[index]['date'],
                      amount: transactionData[index]['amount'],
                    );
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/upload product');
        },
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
