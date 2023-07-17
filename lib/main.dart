import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String inputText = '';
  String todo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 175, 54),
        elevation: 1.0,
        title: const Center(
          child: Text('Todo App'),
        ),
        leading: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 175, 54),
            child: Image(image: AssetImage('agric_fresh.png'))),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              cursorColor: Colors.grey[800],
              controller: TextEditingController(text: inputText),
              onTap: () {},
              onChanged: (value) {
                todo = value;
              },
              style: TextStyle(color: Colors.grey[800]),
              decoration: const InputDecoration(
                fillColor: Color.fromARGB(255, 255, 175, 54),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 175, 54))),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                ),
                labelText: 'Todo',
                helperText: 'Enter your todo',
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                print('pressed');
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 255, 175, 54)),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                elevation: MaterialStatePropertyAll(10.0),
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0)),
                overlayColor: MaterialStatePropertyAll(Colors.amber),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_outlined,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: DottedBorder(
                color: const Color.fromARGB(255, 184, 184, 184),
                child: Container(
                  height: 300.00,
                  width: 300.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
