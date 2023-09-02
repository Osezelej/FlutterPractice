import 'package:agric_fresh_app/config.dart';
import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/NegotiationComp.dart';

import 'package:agric_fresh_app/main.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class Negotiation extends StatefulWidget {
  final User_ appuser;
  const Negotiation({super.key, required this.appuser});

  @override
  State<Negotiation> createState() => _NegotiationState();
}

class _NegotiationState extends State<Negotiation> {
  final data = createSignal([]);

  final Dio dio = Dio();
  late User_ appuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      fetchData(context, appuser);
    });
  }

  fetchData(BuildContext context, User_ appuser) async {
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
                    Text('Geting products...')
                  ],
                ),
              ),
            ));
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final response =
          await dio.get('$baseUrl/getfarmersProduct', queryParameters: {
        'email': appuser.email,
      });
      if (response.statusCode == 200) {
        Navigator.pop(context);
        if (response.data != 0) {
          data.set(response.data);
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('No data'),
                  content: Text(
                    ('You dont have any product.'),
                  ),
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
                    'Sorry, an error occured Geting your pending uploads, Pull down to refresh this screen'),
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
                  'Sorry, an error occured Geting your pending uploads, Pull down to refresh this screen'),
            );
          });
    }
  }

  var i = 0;

  @override
  Widget build(BuildContext context) {
    appuser = widget.appuser;
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
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
              child: SignalBuilder(
                signal: data,
                builder: (context, value_, child) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      var value;
                      if (value_.isNotEmpty) {
                        value = value_[index];
                      }

                      return value_.isEmpty
                          ? ListTile(
                              title: Text(
                                'No pending Uploads.',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                NegotiationComp(
                                  image: value['product_photo_url'],
                                  pName: value['product_name'],
                                  pMinPrice: value['product_price'],
                                  id: value['_id']['\$oid'].toString(),
                                  pDesc: value['product_desc'],
                                  from: 'negotiation',
                                ),
                                const SizedBox(
                                  height: 0,
                                )
                              ],
                            );
                    },
                    itemCount: value_.isEmpty ? 1 : value_.length,
                  );
                },
              ),
            )));
  }
}
