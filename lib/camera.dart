import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Cam extends StatefulWidget {
  @override
  _CamState createState() => _CamState();
}

class _CamState extends State<Cam> {
  cmg() async {
    var img = ImagePicker();
    var image = await img.getImage(source: ImageSource.camera);
    print(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: cmg,
        child: Icon(Icons.camera),
      ),
    );
  }
}
