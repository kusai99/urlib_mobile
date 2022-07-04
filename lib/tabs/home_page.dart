import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:face_net_authentication/pages/models/books.dart';
import 'package:face_net_authentication/pages/sign-in.dart';
import '../styles/colors.dart';
import 'package:face_net_authentication/pages/widgets/book_card.dart';
import 'package:face_net_authentication/pages/widgets/book_card_grid.dart';
import 'package:face_net_authentication/pages/landing.dart';
// import 'log';

class Homepage extends StatefulWidget {
  final String? username;
  final String? imagePath;
  const Homepage(this.username, {Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: <Color>[clrbrowndark, clrbrownlight])),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(h * 0.009),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.014, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Hello, ',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffEEF0F2)),
                      ),
                      Text(
                        'Omar Ahmed',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow[100]),
                      ),
                      SizedBox(
                        width: w * 0.20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: GestureDetector(
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyHomePage()))
                            },
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, h * 0.005, 0, w * 0.01),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.grey[100],
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        // body: Container(
        //   color: Colors.grey[200],
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(0, 0, w * 0.015, 0),
        //     child: Card(
        //       child: ListView(
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.fromLTRB(w * 0.02, h * 0.03, 0, 0),
        //             child: Text(
        //               'Just For You',
        //               style: TextStyle(
        //                   // letterSpacing: 1,
        //                   fontSize: 22,
        //                   fontWeight: FontWeight.w800,
        //                   color: Colors.black),
        //             ),
        //           ),
        //           SizedBox(height: h * 0.015),
        //           GridView.builder(
        //               shrinkWrap: true,
        //               physics: ScrollPhysics(),
        //               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //                   maxCrossAxisExtent: 300,
        //                   mainAxisExtent: h * 0.45,
        //                   childAspectRatio: 3 / 2,
        //                   crossAxisSpacing: 0,
        //                   mainAxisSpacing: 8),
        //               itemCount: bookList.length,
        //               itemBuilder: (BuildContext ctx, index) {
        //                 return BookCardGrid(bookList[index]);
        //               }),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('Logs').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return ListTile(
                    title: Text(data['user']),
                    subtitle: Text(data['book']),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
