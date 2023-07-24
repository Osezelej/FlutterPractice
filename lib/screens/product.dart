// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/data.dart';
import 'package:agric_fresh_app/components/productComp.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Uploaded Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Color.fromARGB(255, 255, 175, 54),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ProductComp(
                key: GlobalKey(),
                pImage: dataApi[index]['Image'],
                pName: dataApi[index]['Name'],
                pPrice: dataApi[index]['Price'],
              );
            },
            itemCount: dataApi.length,
          ),
        ));
  }
}
