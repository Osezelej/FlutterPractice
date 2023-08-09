// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  final String? status;
  final String? amount;
  final String? date;
  final String? time;
  final String name;
  const TransactionHistoryItem(
      {this.status,
      this.amount,
      this.date,
      this.time,
      super.key,
      required this.name});

  @override
  Widget build(BuildContext context) {
    final Icon icon = status == 'debit'
        ? Icon(
            Icons.arrow_downward_outlined,
            size: 25,
            color: Colors.red,
          )
        : Icon(
            Icons.arrow_upward_outlined,
            size: 25,
            color: Color.fromARGB(255, 0, 255, 0),
          );
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            minVerticalPadding: 25,
            tileColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '$name'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$amount')
            ]),
            subtitle: Text('$date'),
            trailing: Text('$time'),
            leading: icon,
            titleAlignment: ListTileTitleAlignment.top,
            style: ListTileStyle.list,
          ),
          SizedBox(height: 2.0),
        ],
      ),
    );
  }
}
