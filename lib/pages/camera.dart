import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _image;

  Future getImage() async {
    final imgFile = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(imgFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Câmera"),
        centerTitle: true,
        backgroundColor: Color(0xFFF42B2B),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                onPressed: getImage,
                child: Text(
                  "Abrir câmera",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                color: Colors.redAccent,
              ),
              height: 50.0,
              width: 350.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child:
                _image == null ? Text('No image selected') : Image.file(_image),
            height: 400.0,
            width: 320.0,
          )
        ],
      ),
    );
  }
}
