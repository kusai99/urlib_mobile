import 'package:flutter/material.dart';
import 'package:face_net_authentication/pages/widgets/def_button.dart';

import '../styles/colors.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: <Color>[clrbrowndark, clrbrownlight])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 102, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PROFILE',
                      style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffEEF0F2)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Personal Information',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 3,
                          color: Color(0xffEEF0F2)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: h * 0.6881,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: CircleAvatar(
                            minRadius: 72,
                            backgroundColor: clrStone,
                            child: CircleAvatar(
                              minRadius: 70,
                              backgroundImage: AssetImage(
                                'assets/images/std image.jpg',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffb59279), width: 2),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),

                                  labelText: 'Username',
                                  labelStyle: TextStyle(color: Colors.black),
                                  isDense: true, // Added this
                                  contentPadding:
                                      EdgeInsets.all(15), // Added this
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffb59279), width: 2),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),

                                  labelText: 'Date of Birth',
                                  labelStyle: TextStyle(color: Colors.black),
                                  isDense: true, // Added this
                                  contentPadding:
                                      EdgeInsets.all(15), // Added this
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffb59279), width: 2),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),

                                  labelText: 'Matric Number',
                                  labelStyle: TextStyle(color: Colors.black),
                                  isDense: true, // Added this
                                  contentPadding:
                                      EdgeInsets.all(15), // Added this
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffb59279), width: 2),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),

                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black),
                                  isDense: true, // Added this
                                  contentPadding:
                                      EdgeInsets.all(15), // Added this
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 250, child: DefaultButton('EDIT', () => {})),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
