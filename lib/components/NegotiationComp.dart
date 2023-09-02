import 'package:flutter/material.dart';

class NegotiationComp extends StatefulWidget {
  final String? image;
  final String? pName;
  final String? pMinPrice;
  final String? pMaxPrice;
  final String? from;
  final String? id;
  final String? pDesc;
  const NegotiationComp({
    super.key,
    this.image,
    this.pName,
    this.pMinPrice,
    this.pMaxPrice,
    this.from,
    required this.id,
    required this.pDesc,
  });

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

    return Stack(
      children: [
        AnimatedContainer(
          height: 230,
          duration: const Duration(milliseconds: 30),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
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
                        'id': '${widget.id}',
                        'min_productPrice': '${widget.pMinPrice}',
                        'max_productPrice': '${widget.pMaxPrice}',
                        'productName': '${widget.pName}',
                        'productImage': '${widget.image}',
                        'productDescription': '${widget.pDesc}',
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
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.pMinPrice} - ${widget.pMaxPrice}',
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent),
                )
              ])
            ],
          ),
        ),
        widget.from == 'negotiation'
            ? Positioned(
                right: 20,
                top: 20,
                child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red[700],
                    ),
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )))
            : Container()
      ],
    );
  }
}
