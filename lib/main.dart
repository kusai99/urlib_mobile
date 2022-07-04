import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/pages/landing.dart';
import 'package:flutter/material.dart';
import 'styles/colors.dart';
import 'pages/landing.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

const SERVER_IP = 'http://192.168.141.21:8000';
final storage = FlutterSecureStorage();

void main() async {
  // await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.white, secondary: clrbrown),
          fontFamily: 'NordiquePro'),
      home: MyHomePage(),
    );
  }
}
