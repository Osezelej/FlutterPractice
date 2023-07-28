import 'package:flutter/material.dart';

class ValidItem extends StatefulWidget {
  final Widget validComp;
  const ValidItem({super.key, this.validComp = const Placeholder()});

  @override
  State<ValidItem> createState() => _ValidItemState();
}

class _ValidItemState extends State<ValidItem> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    if (i == 0) {}

    return const Placeholder();
  }
}
