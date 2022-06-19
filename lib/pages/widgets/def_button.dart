import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:face_net_authentication/styles/colors.dart';
import 'package:face_net_authentication/tabs/home_page.dart';
import '../models/books.dart';

class DefaultButton extends StatelessWidget {
  late final String buttonText;
  late Function onPress;

  DefaultButton(this.buttonText, this.onPress);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.6,
      height: h * 0.061,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: <Color>[clrbrowndark, clrbrownlight]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
          onPressed: () {
            onPress();
          },
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey[100],
              ),
            ),
          )),
    );
  }
}
