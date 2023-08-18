// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:agric_fresh_app/config.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:agric_fresh_app/components/productComp.dart';

class Product extends StatefulWidget {
  final User_ appuser;
  const Product({super.key, required this.appuser});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
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

  deleteData(String id) async {
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
                    Text('Deleting product...')
                  ],
                ),
              ),
            ));
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final response =
          await dio.get('$baseUrl/deleteProduct', queryParameters: {
        'id': id,
      });
      if (response.statusCode == 200) {
        Navigator.pop(context);
        print(response.data);
        if (response.data != 0) {
          fetchData(context, appuser);
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('No data'),
                  content: Text(
                    ('sorry an  error occured'),
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
                    'Sorry, an error occured deleting this product, try again later'),
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
                  'Sorry, an error occured deleting this product, try again later'),
            );
          });
    }
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
                    Text('Geting your product...')
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
                    ('You dont have uploaded product'),
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
                    'Sorry, an error occured Geting your product, Pull down to refresh this screen'),
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
                  'Sorry, an error occured Geting your product, Pull down to refresh this screen'),
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
        title: Text(
          'Uploaded product',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 255, 175, 54),
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
                            'No Product uploaded',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ProductComp(
                              pImage: value['product_photo_url'],
                              pName: value['product_name'],
                              pPrice: value['product_price'],
                              numberSold: value['product_sold'],
                              pId: value['id'],
                              deleteProduct: (String id) {
                                deleteData(id);
                                print(id);
                              },
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
