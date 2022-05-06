import 'dart:io';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.image_path}) : super(key: key);
  var image_path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display the picture"),
      ),
      body: Image.file(File(image_path)),
    );
  }
}
