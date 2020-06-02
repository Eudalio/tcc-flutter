import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparativo entre frameworks"),
        centerTitle: true,
        backgroundColor: Color(0xFFF42B2B),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
