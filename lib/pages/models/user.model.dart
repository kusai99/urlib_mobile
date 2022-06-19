import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String matric;
  final String fname;
  final String lname;
  final String password;
  final List modelData;

  User({
    required this.matric,
    required this.password,
    required this.fname,
    required this.lname,
    required this.modelData,
  });

  static User fromMap(Map<String, dynamic> user) {
    return new User(
      matric: user['matric'],
      password: user['password'],
      fname: user['fname'],
      lname: user['fname'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'matric': matric,
      'password': password,
      'fname': fname,
      'lname': lname,
      'model_data': jsonEncode(modelData),
    };
  }

  User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : modelData = json.decode(doc.data()!["model_data"]),
        matric = doc.data()!["matric"],
        password = doc.data()!["password"],
        fname = doc.data()!['fname'],
        lname = doc.data()!['lname'];
}
