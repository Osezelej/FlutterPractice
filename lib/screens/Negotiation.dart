import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/data.dart';
import 'package:agric_fresh_app/components/NegotiationComp.dart';

class Negotiation extends StatelessWidget {
  const Negotiation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Negotiation',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xffffaf36),
      ),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                dataApi.map((value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      NegotiationComp(
                        image: value['Image'],
                        pName: value['Name'],
                        pPrice: value['Price'],
                      ),
                      const SizedBox(
                        height: 0,
                      )
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
