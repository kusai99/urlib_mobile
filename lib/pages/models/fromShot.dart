class fromShot {
  bool? facedetected;
  String? imgFile;

  Map<String, dynamic> toMap() {
    return {'det': facedetected, 'img': imgFile};
  }
}
