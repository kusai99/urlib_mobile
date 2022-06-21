import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/pages/models/user.model.dart';
import 'package:face_net_authentication/pages/widgets/app_button.dart';
import 'package:face_net_authentication/pages/widgets/app_text_field.dart';
import 'package:face_net_authentication/pages/widgets/home.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/tabs/home_page.dart';
import 'package:flutter/material.dart';
import 'auth-action-button.dart';
import 'package:http/http.dart' as http;
import 'package:face_net_authentication/main.dart';

bool check_face = false;

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.user}) : super(key: key);
  final User user;
  final TextEditingController _matricTextEditingController =
      TextEditingController(text: '');
  final _passwordTextEditingController = TextEditingController();
  final _cameraService = locator<CameraService>();

  Future<String> attemptLogIn(String matric, String password) async {
    print('in');
    var res = await http.post(Uri.parse("$SERVER_IP/login"),
        body: {"user_id": matric, "pw": password});
    if (res.statusCode == 200) return res.body;
    return res.statusCode.toString();
  }

  Future _signIn(context, user) async {
    String matric = _matricTextEditingController.text;
    String password = _passwordTextEditingController.text;

    String jwt = await attemptLogIn(user.matric, user.password);
    print('JWT ${jwt}');
    if (user.password == _passwordTextEditingController.text) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => BarMaker(
                    user.fname,
                    imagePath: _cameraService.imagePath!,
                  )));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Wrong password!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'Welcome back, ' + user.fname + '.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                AppTextField(
                  controller: _passwordTextEditingController,
                  labelText: "Password",
                  isPassword: true,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                AppButton(
                  text: 'LOGIN',
                  onPressed: () async {
                    _signIn(context, user);
                  },
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
