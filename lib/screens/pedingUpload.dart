import 'package:agric_fresh_app/components/data.dart';
import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/NegotiationComp.dart';

class PendingUpload extends StatelessWidget {
  const PendingUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pending upload',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var value = dataApi[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NegotiationComp(
                  image: value['Image'],
                  pName: value['Name'],
                  pPrice: value['Price'],
                  from: 'pending',
                ),
                const SizedBox(
                  height: 0,
                )
              ],
            );
          },
          itemCount: dataApi.length,
        ),
      ),
    );
  }
}
