import 'package:flutter/material.dart';

import 'package:tcc_flutter/pages/localizacao.dart';
import 'package:tcc_flutter/pages/camera.dart';
import 'package:tcc_flutter/pages/profile.dart';

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
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 20.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Image.asset(
                          "assets/flutter-logo2.png",
                          fit: BoxFit.cover,
                          height: 140.0,
                          width: 150.0,
                        ),
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                      child: Image.asset(
                        "assets/react-native-logo.png",
                        fit: BoxFit.cover,
                        height: 148.0,
                        width: 150.0,
                      ),
                    ),
                    Text(
                      "React Native",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: 50.0,
                      width: 270.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Text(
                          "Consultar API - GitHub",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        color: Colors.red,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: 50.0,
                      width: 270.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Camera()));
                        },
                        child: Text(
                          "Tirar uma foto",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        color: Colors.red,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: 50.0,
                      width: 270.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Localizacao()));
                        },
                        child: Text(
                          "Localização",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
