import 'package:flutter/material.dart';
import 'package:face_net_authentication/pages/widgets/def_button.dart';
import 'package:path/path.dart';
import 'package:face_net_authentication/styles/colors.dart';
import 'package:face_net_authentication/tabs/home_page.dart';
import '../models/books.dart';

class BookCardGrid extends StatelessWidget {
  late final Book book;
  BookCardGrid(this.book);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Container(
              height: h * 0.3,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: (book.image),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.all(2),
              ),
            ),
            Container(
                height: h * 0.12,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        "Genre:",
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[800]),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "${book.genre.name}",
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[800]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.008,
                      ),
                      Flexible(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: <Color>[
                                      Color(0xff007475),
                                      Color(0xff229389)
                                    ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.info,
                                        color: Colors.grey[100],
                                      ),
                                      Container(
                                          width: w * 0.2,
                                          height: h * 0.03,
                                          child: Center(
                                            child: Text(
                                              "Details",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffEEF0F2),
                                              ),
                                            ),
                                          )),
                                    ],
                                  )),
                            )),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
