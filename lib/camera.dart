import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Cam extends StatefulWidget {
  @override
  _CamState createState() => _CamState();
}

class _CamState extends State<Cam> {
  var fbst = FirebaseStorage.instance;
  File imgpath;
  cmg() async {
    var img = ImagePicker();
    var image = await img.getImage(source: ImageSource.camera);
    var img1 = image.path;
    var fbref = fbst.ref().child('myimages');
    setState(() {
      imgpath = File(img1);
    });
    fbref.putFile(imgpath);
    var furl = await fbref.getDownloadURL();
    print(image.path);
    print(furl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: imgpath == null
            ? Image.network(
                'https://github.com/bansalsajal49/fireapp/blob/master/assets/mng1.png?raw=true')
            : Image.file(
                imgpath,
                fit: BoxFit.fill,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cmg,
        child: Icon(Icons.camera),
      ),
    );
  }
}
