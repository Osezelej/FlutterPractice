import 'package:flutter/material.dart';

class SingleNegotiationComp extends StatelessWidget {
  final String? name;
  final String? time;
  final String? lastMessage;
  const SingleNegotiationComp(
      {super.key, this.name, this.time, this.lastMessage});

  @override
  Widget build(BuildContext context) {
    List inputNameList = name?.split(' ') ?? [];
    String namePrefix = '';
    for (int i = 0; i < 2; i++) {
      if (inputNameList.length > i) {
        namePrefix += inputNameList[i][0];
      }
    }

    return ListTile(
      style: ListTileStyle.list,
      tileColor: Colors.white,
      title: Text(name?.toUpperCase() ?? ''),
      subtitle: Text(lastMessage ?? ''),
      trailing: Text(time?.toUpperCase() ?? ''),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 30.0,
        child: Text(namePrefix.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 17.0,
            )),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/singleChat',
          arguments: {
            'data': {'name': name},
          },
        );
      },
    );
  }
}
