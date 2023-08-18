// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductComp extends StatefulWidget {
  final String? pImage;
  final String? pName;
  final String? pPrice;
  final String numberSold;
  final Function deleteProduct;
  final String pId;

  const ProductComp({
    super.key,
    this.pImage,
    this.pName,
    this.pPrice,
    required this.pId,
    required this.numberSold,
    required this.deleteProduct,
  });

  @override
  State<ProductComp> createState() => _ProductCompState();
}

class _ProductCompState extends State<ProductComp> {
  Color borderColor = const Color.fromARGB(255, 189, 189, 189);

  @override
  Widget build(BuildContext context) {
    String numSold = widget.numberSold;

    longpress() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Warning'),
                content: Text(
                    'Are you sure you want to delete this product? note that once deleted it cannot be recorvered.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('NO')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.deleteProduct(widget.pId);
                      },
                      child: Text('YES')),
                ],
              ));
    }

    void _handleTapDown() {
      setState(() {
        borderColor = const Color.fromARGB(255, 255, 175, 54);
      });
    }

    void _handleTapUp() {
      setState(() {
        borderColor = const Color.fromARGB(255, 141, 141, 141);
      });
    }

    return GestureDetector(
      onLongPress: () {
        longpress();
      },
      onTapDown: (_) {
        _handleTapDown();
      },
      onTapUp: (details) {
        _handleTapUp();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(5.0),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
              color: borderColor,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              blurStyle: BlurStyle.outer),
        ]),
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 237,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 3.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'NUMBER SOLD',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  numSold,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Image.network(
              widget.pImage ?? '',
              height: 145,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                widget.pName ?? '',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.pPrice ?? '',
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.redAccent),
              )
            ]),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
