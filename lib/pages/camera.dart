import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Câmera"),
        centerTitle: true,
        backgroundColor: Color(0xFFF42B2B),
      ),
    );
  }
}
