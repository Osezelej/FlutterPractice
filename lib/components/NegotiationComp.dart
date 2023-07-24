import 'package:flutter/material.dart';

class NegotiationComp extends StatefulWidget {
  final String? image;
  final String? pName;
  final String? pPrice;
  const NegotiationComp({super.key, this.image, this.pName, this.pPrice});

  @override
  State<NegotiationComp> createState() => _NegotiationCompState();
}

class _NegotiationCompState extends State<NegotiationComp> {
  Color borderColor = Color.fromARGB(255, 189, 189, 189);

  @override
  Widget build(BuildContext context) {
    void handleTapDown() {
      setState(() {
        borderColor = const Color.fromARGB(255, 255, 175, 54);
      });
    }

    void handleTapUp() {
      setState(() {
        borderColor = const Color.fromARGB(255, 141, 141, 141);
      });
    }

    return AnimatedContainer(
      height: 230,
      duration: Duration(milliseconds: 30),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
            color: borderColor,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            blurStyle: BlurStyle.outer),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Map<String, String?> data = {
                'productName': widget.pName,
                'productImage': widget.image
              };
              Navigator.pushNamed(context, '/product-chat',
                  arguments: {'data': data});
            },
            onTapDown: (details) {
              handleTapDown();
            },
            onTapUp: (details) {
              handleTapUp();
            },
            child: Image.network(
              widget.image ?? '',
              height: 146,
              fit: BoxFit.fill,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              widget.pName ?? '',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.pPrice ?? '',
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent),
            )
          ])
        ],
      ),
    );
  }
}
