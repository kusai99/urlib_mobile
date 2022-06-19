import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:face_net_authentication/styles/colors.dart';
import 'package:face_net_authentication/tabs/home_page.dart';
import '../models/books.dart';
import 'package:face_net_authentication/pages/models/genres.dart';

class ChoiceButton extends StatefulWidget {
  late final Genre genre;
  ChoiceButton(this.genre);

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return OutlinedButton(
        onPressed: () {
          setState(() {});
          widget.genre.isSelected = !widget.genre.isSelected;
          print(widget.genre.isSelected);
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
              color: widget.genre.isSelected ? Colors.white : Colors.grey,
              width: widget.genre.isSelected ? 0.2 : 0,
              style: BorderStyle.solid)),
          backgroundColor: MaterialStateProperty.all(
              widget.genre.isSelected ? clrLightGreen : Colors.grey[100]),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
        ),
        child: Container(
            width: w * 0.45,
            height: h * 0.061,
            child: Center(
              child: Text(
                widget.genre.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color:
                      widget.genre.isSelected ? Colors.grey[100] : Colors.black,
                ),
              ),
            )));
  }
}
