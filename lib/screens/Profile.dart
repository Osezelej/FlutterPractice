import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 255, 175, 75),
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Color.fromARGB(255, 255, 175, 75),
                    backgroundImage: AssetImage('agric_fresh.png'),
                  ),
                ),
                Positioned(
                    top: 13,
                    right: 19,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 255, 175, 74)),
                        child: Icon(
                          Icons.edit_rounded,
                          size: 20,
                        ),
                      ),
                    ))
              ]),
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(
                  'Farm Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_rounded,
                      color: Color.fromARGB(255, 255, 175, 75),
                    ))
              ]),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Text(
                  'Art Template',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text(
                  'Company/Farm phone number ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_rounded,
                      color: Color.fromARGB(255, 255, 175, 75),
                    ))
              ]),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Text(
                  '08076320300',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text(
                  'Farm Address/Pickup Location',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_rounded,
                      color: Color.fromARGB(255, 255, 175, 75),
                    ))
              ]),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Text(
                  '20, Along Farm Rd, AtanOta, Ogun State, Nigeria.',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 175, 75))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Apply Changes',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )),
        )
      ]),
    );
  }
}
