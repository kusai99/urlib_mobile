import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:face_net_authentication/tabs/home_page.dart';

import 'package:face_net_authentication/tabs/profile_page.dart';
import 'package:face_net_authentication/tabs/search_page.dart';
import 'package:face_net_authentication/styles/colors.dart';
import 'package:flutter/material.dart';

class BarMaker extends StatefulWidget {
  final String username;
  final String imagePath;
  // const BarMaker({Key? key}) : super(key: key);
  BarMaker(this.username, {Key? key, required this.imagePath});

  @override
  State<BarMaker> createState() => BarMakerState();
}

class BarMakerState extends State<BarMaker> {
  static String? name;
  static String? path;
  void initState() {
    super.initState();
    String username = widget.username;
    String imagePath = widget.imagePath;
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Homepage(
      name,
      imagePath: path,
    ),
    SearchPage(),
    Profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Serach',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff654321),
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home(this.jwt, this.payload);

  factory Home.fromBase64(String jwt) => Home(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: clrbrown,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Column(children: [
                  Center(
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: CircleAvatar(
                            minRadius: 80,
                            backgroundImage: AssetImage(
                              'assets/images/std image.jpg',
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome ",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Omar Ahmed",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: clrStone,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                          child: Center(
                            child: Text(
                              "Here Are Some Book Recommendations Made Just For You",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
