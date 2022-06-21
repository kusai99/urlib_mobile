import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String matric;
  final String fname;
  final String lname;
  final String password;
  final List modelData;
  // final String imgFile;

  User({
    required this.matric,
    required this.password,
    required this.fname,
    required this.lname,
    required this.modelData,
    // required this.imgFile,
  });

  static User fromMap(Map<String, dynamic> user) {
    return new User(
        matric: user['matric'],
        password: user['password'],
        fname: user['fname'],
        lname: user['fname'],
        modelData: jsonDecode(user['model_data']));
    // imgFile: user['imgFile'].toString());
  }

  toMap() {
    return {
      'matric': matric,
      'password': password,
      'fname': fname,
      'lname': lname,
      'model_data': jsonEncode(modelData),
      // 'imgFile': imgFile,
    };
  }

  User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : modelData = json.decode(doc.data()!["model_data"]),
        matric = doc.data()!["matric"],
        password = doc.data()!["password"],
        fname = doc.data()!['fname'],
        lname = doc.data()!['lname'];
  // imgFile = doc.data()!['imgFile'];
}
