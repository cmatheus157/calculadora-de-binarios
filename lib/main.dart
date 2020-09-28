import 'package:binary/binary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculadora Binaria'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController operacao = TextEditingController();
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();
  int resultado;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: TextFormField(
                controller: operacao,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: ' +, -, *, /, %',
                  labelText: 'insira uma operação entre  +, -, *, /, %',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: TextFormField(
                controller: valor1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '',
                  labelText: 'insira a valor em binario ',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: TextFormField(
                controller: valor2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '',
                  labelText: 'insira a valor em binario ',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              'Resultado',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // print(25.toBinary().toString());
              //  valor1.text.
              int val1;
              int val2;
              val1 = valor1.text.bits;

              val2 = valor2.text.bits;

              print(val1);
              print(val2);

              setState(() {
                switch (operacao.text) {
                  case '+':
                    resultado = val1 + val2;
                    break;
                  case '-':
                    resultado = val1 - val2;
                    break;
                  case '*':
                    resultado = val1 * val2;
                    break;
                  case '/':
                    var res = val1 / val2;
                    resultado = res.toInt();

                    break;
                  case '%':
                    resultado = val1 % val2;
                    break;
                }
              });
              print(resultado);
              print(resultado.toBinary().toString());
              // print(resultado.toString());
              // print(resultado.toBinary().toString());
            },
          ),
          Center(
              child: Text('O resultado é : ' + resultado.toBinary().toString()))
        ],
      ),
    );
  }
}
