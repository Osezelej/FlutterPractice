import 'dart:io';

import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/data.dart';
import 'package:agric_fresh_app/components/NegotiationComp.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:agric_fresh_app/main.dart';

class Negotiation extends StatefulWidget {
  final User_ appuser;
  const Negotiation({super.key, required this.appuser});

  @override
  State<Negotiation> createState() => _NegotiationState();
}

class _NegotiationState extends State<Negotiation> {
  late User_ appuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var socket = IO.io('https://4v6gzz-3001.csb.app/farmers');

      socket.auth = {'email': appuser.id, 'name': appuser.farmName};
      socket.on('hello', (data) => print(data));
      socket.on('private_message', (data) => print(data));
      await Future.delayed(Duration(milliseconds: 5000), () {});
    });
  }

  @override
  Widget build(BuildContext context) {
    appuser = widget.appuser;
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Negotiation',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xffffaf36),
          ),
          body: Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    dataApi.map((value) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          NegotiationComp(
                            image: value['Image'],
                            pName: value['Name'],
                            pPrice: value['Price'],
                            from: 'negotiation',
                            id: value['id'].toString(),
                            pDesc: value['description'],
                          ),
                          const SizedBox(
                            height: 0,
                          )
                        ],
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
