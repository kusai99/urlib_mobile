import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:face_net_authentication/styles/colors.dart';
import 'package:face_net_authentication/tabs/home_page.dart';
import 'package:face_net_authentication/tabs/home_page.dart';
import '../models/books.dart';

class BookCard extends StatelessWidget {
  late final Book book;
  BookCard(this.book);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.all(2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Image(
                image: book.image.image,
                height: h * 0.2,
                width: w * 0.25,
              ),
            ),
          ),
          SizedBox(width: w * 0.05),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: w * 0.6,
                  child: Text(
                    book.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  width: w * 0.6,
                  child: Text(
                    "${book.author}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  "ISBN: ${book.isbn.toString()}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  book.av
                      ? "Available at the library"
                      : "Unavailable at the library",
                  style: TextStyle(
                      color: book.av ? clrLightGreen : clrmaroon,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(width: w * 0.01),
        ],
      ),
    );
  }
}
