import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey _listkey = GlobalKey();
  final ScrollController _controller = ScrollController();
  final List<Map> chatdata = [
    {
      'message': 'hello',
      'from': 'osezelejoseph@gmail.com',
      'username': 'osezele joseph',
      'to': 'agric fresh',
      'status': 'recieved'
    },
    {
      'message': 'hi',
      'from': 'osezelejoseph@gmail.com',
      'username': 'osezele joseph',
      'to': 'agric fresh',
      'status': 'sent'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            foregroundColor: Color.fromRGBO(255, 175, 74, 1),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color.fromARGB(255, 255, 175, 75),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Text(
                      'OJ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Osezele Joseph',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
        body: Stack(
          children: [
            ListView.builder(
                key: _listkey,
                controller: _controller,
                itemCount: chatdata.length,
                itemBuilder: (context, index) {
                  if (chatdata.elementAt(index)['status'] == 'sent') {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 140, 36),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(chatdata.elementAt(index)['message']),
                    );
                  } else {
                    return Container(
                      constraints: const BoxConstraints(
                        minWidth: 120.0,
                        maxWidth: 250,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 175, 54),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(chatdata.elementAt(index)['message']),
                    );
                  }
                })
          ],
        ));
  }
}
