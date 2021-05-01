import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

/////////////////CLASSE
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variaveis para modificacao de tela
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _chancePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _people = 0;
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //imagem de fundo
        Image.asset(
          "images/fundo.png",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        //coluna para centralizar os widgets
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            "Pessoas: $_people",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          //fila para alinhar o aplicativo com os butões
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                //butao 1
                child: FlatButton(
                  child: Text(
                    "+1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                  onPressed: () {
                    _chancePeople(1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                //butao 2
                child: FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                  onPressed: () {
                    _chancePeople(-1);
                  },
                ),
              ),
            ],
          ),
          //a fila esta dentro da coluna, sendo abaixo a continuacao da coluna
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ])
      ],
    );
  }
}
