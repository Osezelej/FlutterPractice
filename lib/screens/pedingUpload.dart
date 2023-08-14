import 'package:agric_fresh_app/config.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/NegotiationComp.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PendingUpload extends StatefulWidget {
  final User_ appuser;
  PendingUpload({required this.appuser});

  @override
  State<PendingUpload> createState() => _PendingUploadState();
}

class _PendingUploadState extends State<PendingUpload> {
  final data = createSignal([]);
  late User_ appuser;

  final Dio dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
                    Text('Geting pending uploads...')
                  ],
                ),
              ),
            ));
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final response =
          await dio.get('$baseUrl/getPendingUpload', queryParameters: {
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
                    ('You dont have any pending uploads.'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending upload',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        foregroundColor: const Color.fromARGB(255, 255, 175, 75),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() => null);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
                              pPrice: value['product_price'],
                              id: value['_id']['\$oid'].toString(),
                              pDesc: value['product_desc'],
                              from: 'pending',
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
        ),
      ),
    );
  }
}
