// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  final String? status;
  final String? amount;
  final String? date;
  final String? time;
  const TransactionHistoryItem(
      {this.status, this.amount, this.date, this.time, super.key});

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
            color: Colors.green,
          );
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title: Text('$amount'),
          titleAlignment: ListTileTitleAlignment.center,
          subtitle: Text('$date-$time'),
          leading: icon,
          style: ListTileStyle.list,
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
