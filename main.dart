import 'package:flutter/material.dart';

import 'upload_image_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'API Example',
      home: UploadImage(),
    );
  }
}
