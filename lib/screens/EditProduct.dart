// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Map data_;
  late final String persistentProductName;
  late final String persistentProductPrice;
  late final String persistentProductDescription;

  Color iconColor = Colors.black38;
  late String _value;
  late String _price;
  late String _product_name;
  late Widget _animatedWidget;
  late Widget _animatedWidgetPrice;
  late Widget _animatedWidgetProduct;
  int displayed = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    Map? data = ModalRoute.of(context)!.settings.arguments as Map;

    _price = data['data']['productPrice'];
    _product_name = data['data']['productName'];
    _value = data['data']['productDescription'];

    if (displayed == 0) {
      persistentProductDescription = data['data']['productDescription'];
      persistentProductName = data['data']['productName'];
      persistentProductPrice = data['data']['productPrice'];
      _animatedWidget = Container(
        key: GlobalKey(),
        padding: EdgeInsets.all(5),
        width: 230,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 182, 182, 182),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(_value),
      );

      _animatedWidgetPrice = Container(
        key: GlobalKey(),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _price,
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: 15,
              fontWeight: FontWeight.w900),
        ),
      );
      _animatedWidgetProduct = Container(
        key: GlobalKey(),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _product_name,
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: 15,
              fontWeight: FontWeight.w900),
        ),
      );
    }
    displayed++;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Edit product',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              centerTitle: false,
              foregroundColor: Color.fromARGB(255, 255, 175, 54),
              elevation: 10.0,
              shadowColor: Colors.grey[200],
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  data['data']['productName'] ?? '',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    data['data']['productImage'] ?? '',
                    opacity: const AlwaysStoppedAnimation(1.0),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                  child: Container(
                    width: 250,
                    constraints: BoxConstraints.tightFor(width: 250),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: DottedBorder(
                      strokeWidth: 0.5,
                      dashPattern: [16, 7],
                      radius: Radius.circular(15),
                      color: Color.fromARGB(116, 255, 174, 74),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Product Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      focusColor:
                                          Color.fromARGB(255, 255, 175, 74),
                                      onPressed: () {
                                        setState(() {
                                          _animatedWidgetProduct = Container(
                                            key: GlobalKey(),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Product Name',
                                                  floatingLabelStyle: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 175, 74)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.5,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    175,
                                                                    74),
                                                          )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                        width: 1.5,
                                                        color: Color.fromARGB(
                                                            255, 182, 182, 182),
                                                      ))),
                                              textInputAction:
                                                  TextInputAction.done,
                                              onEditingComplete: () {
                                                setState(() {
                                                  _animatedWidgetProduct =
                                                      Container(
                                                    key: GlobalKey(),
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      _product_name,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  );
                                                });
                                              },
                                              autofocus: true,
                                              maxLines: 1,
                                              onChanged: (value) {
                                                _product_name = value;
                                              },
                                              controller: TextEditingController(
                                                  text: _product_name),
                                            ),
                                          );
                                        });
                                      },
                                      color: iconColor,
                                      iconSize: 19,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedSwitcher(
                                      duration: Duration(milliseconds: 500),
                                      transitionBuilder: (child, animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        );
                                      },
                                      child: _animatedWidgetProduct,
                                    ),
                                  ]),
                              Row(
                                children: [
                                  Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                      focusColor:
                                          Color.fromARGB(255, 255, 175, 74),
                                      onPressed: () {
                                        setState(() {
                                          _animatedWidgetPrice = Container(
                                            key: GlobalKey(),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Price',
                                                  floatingLabelStyle: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 175, 74)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            width: 1.5,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    175,
                                                                    74),
                                                          )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                        width: 1.5,
                                                        color: Color.fromARGB(
                                                            255, 182, 182, 182),
                                                      ))),
                                              textInputAction:
                                                  TextInputAction.done,
                                              onEditingComplete: () {
                                                setState(() {
                                                  _animatedWidgetPrice =
                                                      Container(
                                                    key: GlobalKey(),
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      _price,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  );
                                                });
                                              },
                                              autofocus: true,
                                              maxLines: 1,
                                              onChanged: (value) {
                                                _price = value;
                                              },
                                              controller: TextEditingController(
                                                  text: _price),
                                            ),
                                          );
                                        });
                                      },
                                      color: iconColor,
                                      iconSize: 19,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 500),
                                    transitionBuilder: (child, animation) {
                                      return ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    child: _animatedWidgetPrice,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                          ),
                                          focusColor:
                                              Color.fromARGB(255, 255, 175, 74),
                                          onPressed: () {
                                            setState(() {
                                              _animatedWidget = SizedBox(
                                                key: GlobalKey(),
                                                width: 300,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      labelText: 'Description',
                                                      floatingLabelStyle:
                                                          TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      175,
                                                                      74)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 1.5,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        175,
                                                                        74),
                                                              )),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 1.5,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        182,
                                                                        182,
                                                                        182),
                                                              ))),
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  onEditingComplete: () {
                                                    setState(() {
                                                      _animatedWidget =
                                                          Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        width: 230,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    182,
                                                                    182,
                                                                    182),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Text(_value),
                                                      );
                                                    });
                                                  },
                                                  autofocus: true,
                                                  maxLines: 6,
                                                  onChanged: (value) {
                                                    _value = value;
                                                  },
                                                  controller:
                                                      TextEditingController(
                                                          text: _value),
                                                ),
                                              );
                                            });
                                          },
                                          color: iconColor,
                                          iconSize: 19,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AnimatedSwitcher(
                                        duration: Duration(milliseconds: 500),
                                        transitionBuilder: (child, animation) {
                                          return ScaleTransition(
                                            scale: animation,
                                            child: child,
                                          );
                                        },
                                        child: _animatedWidget,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(5),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 175, 75))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
