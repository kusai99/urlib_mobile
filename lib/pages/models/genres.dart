import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Genre {
  late final int id;
  late final String name;
  late final Color color;
  late  bool isSelected;
  Genre(this.id, this.name, this.color, this.isSelected);
}

List<Genre> genreList = [
  Genre(1, 'Engineering', Color(0xff008081), false),
  Genre(2, 'Linguistics', Color(0xff008081), false),
  Genre(3, 'Novels', Color(0xff008081), false),
  Genre(4, 'Geography', Color(0xff008081), false),
  Genre(5, 'Biography', Color(0xff008081), false),
  Genre(6, 'History', Color(0xff008081), false),
  Genre(7, 'Islamic Studies', Color(0xff008081), false),
  Genre(8, 'Technology', Color(0xff008081), false),
  Genre(10, 'Architecture', Color(0xff008081), false),
  Genre(9, 'Law Studies', Color(0xff008081), false),

];
