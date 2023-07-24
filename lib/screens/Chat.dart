import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

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
    Map? data = ModalRoute.of(context)!.settings.arguments as Map ??
        {'name': '', 'iconImage': ''};

    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            foregroundColor: Color.fromARGB(255, 164, 148, 130),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color.fromARGB(255, 255, 175, 75),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Text(
                      data['data']['iconImage'] ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  data['data']['name'] ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              ListView.builder(
                itemBuilder: ((context, index) {
                  switch (chatdata[index]['status']) {
                    case 'sent':
                      return BubbleSpecialOne(
                        text: chatdata[index]['message'],
                        tail: true,
                        color: const Color.fromARGB(255, 255, 175, 74),
                        delivered: true,
                        seen: true,
                      );
                    case 'recieved':
                      return BubbleSpecialOne(
                          text: chatdata[index]['message'],
                          tail: true,
                          isSender: false,
                          color: Color.fromARGB(255, 210, 210, 210));
                  }
                }),
                itemCount: chatdata.length,
                controller: _controller,
                key: _listkey,
              ),
              MessageBar(
                sendButtonColor: Color.fromARGB(255, 255, 175, 74),
                onSend: (data) {
                  setState(() {
                    chatdata.add(
                        {'status': 'sent', 'message': data, 'time': '8:20am'});
                  });
                },
              )
            ],
          ),
        ));
  }
}
