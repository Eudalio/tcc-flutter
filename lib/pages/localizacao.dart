import 'package:flutter/material.dart';

class Localizacao extends StatefulWidget {
  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localização"),
        centerTitle: true,
        backgroundColor: Color(0xFFF42B2B),
      ),
    );
  }
}
