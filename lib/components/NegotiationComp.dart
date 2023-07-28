import 'package:flutter/material.dart';

class NegotiationComp extends StatefulWidget {
  final String? image;
  final String? pName;
  final String? pPrice;
  final String? from;
  const NegotiationComp(
      {super.key, this.image, this.pName, this.pPrice, this.from});

  @override
  State<NegotiationComp> createState() => _NegotiationCompState();
}

class _NegotiationCompState extends State<NegotiationComp> {
  Color borderColor = const Color.fromARGB(255, 189, 189, 189);

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
      duration: const Duration(milliseconds: 30),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              if (widget.from == 'negotiation') {
                Navigator.pushNamed(context, '/product-chat',
                    arguments: {'data': data});
              } else if (widget.from == 'pending') {
                Navigator.pushNamed(context, '/editProduct', arguments: {
                  'data': {
                    'productPrice': '${widget.pPrice}',
                    'productName': '${widget.pName}',
                    'productImage': '${widget.image}',
                    'productDescription':
                        'this is a description that will tell you how nicen the product are and they are very nice. the thimg is just that i am not a very happy person i always look for something that makes me sad and i dont know why that is i hope that this ends soon i love you all',
                  }
                });
              }
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
