// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  String productNameInput = '';
  String priceInput = '';
  String descriptionInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 255, 175, 54),
        backgroundColor: Colors.white,
        title: Text(
          'Upload New Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: TextEditingController(text: productNameInput),
                onChanged: (value) {
                  productNameInput = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                    hintText: 'Name of product',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text('Product name')),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: TextEditingController(text: descriptionInput),
                onChanged: (value) {
                  descriptionInput = value;
                },
                maxLines: 10,
                decoration: InputDecoration(
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text('Product Description')),
              ),
              SizedBox(
                height: 10,
              ),
              DottedBorder(
                  strokeWidth: 1.5,
                  color: Colors.grey,
                  radius: Radius.circular(5.0),
                  child: Container(
                    height: 230,
                    child: Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.grey[600],
                            ),
                            focusColor: Color.fromARGB(255, 255, 175, 54),
                          ),
                          SizedBox(width: 20),
                          Text('Upload farm-product Photo')
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: TextEditingController(text: priceInput),
                onChanged: (value) {
                  priceInput = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                    hintText: 'Product Price',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text('Product Price')),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                ),
                label: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 175, 54)),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                    foregroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
              SizedBox(
                height: 30,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
