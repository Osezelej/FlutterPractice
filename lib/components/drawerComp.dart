// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Icon? trailing;
  final Icon? leading;
  final String? text;
  final String url;
  const DrawerItem(
      {super.key, this.leading, this.text, this.trailing, this.url = '/'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          style: ListTileStyle.drawer,
          trailing: trailing,
          leading: leading,
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          focusColor: Color(0xffffaf36),
          onTap: () {
            Navigator.pushNamed(context, url);
          },
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
