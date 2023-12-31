import 'package:flutter/material.dart';
import 'package:agric_fresh_app/components/singleNegotiaitonComp.dart';

class ProductChat extends StatefulWidget {
  const ProductChat({super.key});

  @override
  State<ProductChat> createState() => _ProductChatState();
}

class _ProductChatState extends State<ProductChat>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SliverAnimatedListState> _listkey = GlobalKey();
  final List<Widget> data_ = [];
  final itemCount = [
    {
      'name': 'Osezele Joseph',
      'time': '7:50am',
      'message': 'i have seen it',
      'email': 'osezelejoseph@gmail.com'
    },
    {
      'name': 'John Doe',
      'time': '7:50am',
      'message': 'i have seen it',
      'email': '3osezelejoseph@gmail.com'
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      for (var element in itemCount) {
        data_.add(SingleNegotiationComp(
            key: UniqueKey(),
            name: element['name'],
            lastMessage: element['message'],
            time: element['time']));

        _listkey.currentState!.insertItem(data_.length - 1,
            duration: const Duration(milliseconds: 300));
        await Future.delayed(const Duration(milliseconds: 100));
      }
    });
  }

  final Tween<Offset> _listOffset = Tween(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  );
  @override
  Widget build(BuildContext context) {
    Map? data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            title: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
              child: Text(
                data['data']['productName'] ?? '',
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: false,
            foregroundColor: const Color.fromARGB(255, 255, 175, 54),
            elevation: 10.0,
            shadowColor: Colors.grey[200],
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.network(
                  data['data']['productImage'] ?? '',
                  opacity: const AlwaysStoppedAnimation(1.0),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverAnimatedList(
            key: _listkey,
            itemBuilder: (context, index, animation) {
              print(data_[index]);
              return SlideTransition(
                key: UniqueKey(),
                position: animation.drive(_listOffset),
                child: data_[index],
              );
            },
            initialItemCount: data_.length,
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     itemCount.add('1');
      //     print(itemCount);
      //     _listkey.currentState!.insertItem(itemCount.length - 1,
      //         duration: const Duration(milliseconds: 500));
      //   },
      //   child: Text('add'),
      // ),
    );
  }
}
