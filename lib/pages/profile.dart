import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final fieldUserController = TextEditingController();
  dynamic userLoaded;

  final _formKey = GlobalKey<FormState>();

  void _searchUser() async {
    http.Response response;

    response = await http
        .get("https://api.github.com/users/${fieldUserController.text}");

    setState(() {
      userLoaded = json.decode(response.body);
    });

    print(userLoaded);
  }

  void _resetField() {
    fieldUserController.text = "";

    setState(() {
      userLoaded = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Usuário"),
          centerTitle: true,
          backgroundColor: Color(0xFFF42B2B),
        ),
        body: Column(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Digite um usuário",
                            labelStyle: TextStyle(color: Color(0xFFF42B2B))),
                        style: TextStyle(fontSize: 20.0),
                        controller: fieldUserController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira um usuário";
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            onPressed: _searchUser,
                            child: Text(
                              "Buscar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            color: Colors.redAccent,
                          ),
                          height: 50.0,
                          width: 150.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            onPressed: _resetField,
                            child: Text(
                              "Limpar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            color: Colors.redAccent,
                          ),
                          height: 50.0,
                          width: 150.0,
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              child: userLoaded == null
                  ? null
                  : Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(userLoaded["avatar_url"]))),
                        ),
                        Padding(
                          child: Text(
                            userLoaded["name"],
                          ),
                          padding: EdgeInsets.only(bottom: 8.0),
                        ),
                        Padding(
                          child: Text(userLoaded["bio"],
                              textAlign: TextAlign.center),
                          padding: EdgeInsets.only(bottom: 8.0),
                        ),
                        Padding(
                          child: Text(userLoaded["location"]),
                          padding: EdgeInsets.only(bottom: 8.0),
                        ),
                        Padding(
                          child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.red[400],
                              width: 220.0,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.0, right: 6.0),
                                        child: Text(
                                          "Repos",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        "|",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.0, right: 6.0),
                                        child: Text(
                                          "Followers",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        "|",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.0, right: 4.0),
                                        child: Text(
                                          "Following",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.0, right: 0.0),
                                        child: Text(
                                          userLoaded["public_repos"].toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text(""),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0.0, right: 0.0),
                                        child: Text(
                                          userLoaded["followers"].toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text(""),
                                      Padding(
                                        padding: EdgeInsets.only(right: 30.0),
                                        child: Text(
                                          userLoaded["following"].toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          padding: EdgeInsets.only(bottom: 5.0, top: 10.0),
                        ),
                      ],
                    ),
            )
          ],
        ));
  }
}
