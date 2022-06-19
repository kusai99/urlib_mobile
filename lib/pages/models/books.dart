import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:face_net_authentication/pages/models/genres.dart';

class Book {
  int id;
  int isbn;
  String title;
  String author;
  String publishDate;
  Genre genre;
  bool av;
  Image image;

  late final Color color;
  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.isbn,
      required this.publishDate,
      required this.genre,
      required this.av,
      required this.image});
}

List<Book> bookList = [
  Book(
      id: 1,
      isbn: 1111,
      title: "The Unwritten Laws of Enngineering",
      author: "W.J King",
      publishDate: "2002",
      genre: genreList[0],
      av: true,
      image: Image(
        image: AssetImage("assets/images/engineering.jpg"),
      )),
  Book(
      id: 2,
      isbn: 2222,
      title: "An Introduction to Language and Linguistics",
      author: "Ralph W.Fasold",
      publishDate: "2010",
      genre: genreList[1],
      av: false,
      image: Image(
        image: AssetImage("assets/images/ling.jpg"),
      )),
  Book(
      id: 3,
      isbn: 3333,
      title: "Sahih Albukhari",
      author: "Imam Albukhari",
      publishDate: "2020",
      genre: genreList[6],
      av: false,
      image: Image(
        image: AssetImage("assets/images/islamic.png"),
      )),
  Book(
      id: 4,
      isbn: 4444,
      title: "The Power Of Geography",
      author: "Tim Marshall",
      publishDate: "1960",
      genre: genreList[3],
      av: true,
      image: Image(
        image: AssetImage("assets/images/geo.jpg"),
      )),
  Book(
      id: 5,
      isbn: 5555,
      title: "Surely You're Joking Mr.Feynman",
      author: "Richard Feynman",
      publishDate: "1965",
      av: true,
      genre: genreList[4],
      image: Image(
        image: AssetImage("assets/images/bio.jpg"),
      )),
];
