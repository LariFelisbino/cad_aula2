import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cadastro de novo user',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Cadastro de Usuário'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var userTFF = TextEditingController();

var emailTFF = TextEditingController();

var telTFF = TextEditingController();

var cepTFF = TextEditingController();

var txtU = TextEditingController();

var txtE = TextEditingController();

var txtT = TextEditingController();

var txtC = TextEditingController();

var txtB = TextEditingController();

var txtCi = TextEditingController();





final List<String> entries = <String>[];
var dados = '';

class _MyHomePageState extends State<MyHomePage> {
  void async;
  getCEP() async {
    var url =
        Uri.https('viacep.com.br', 'ws/${cepTFF.text}/json/', {'q': '{http}'});
    var response = await http.get(url);

    print('Status Code response: ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var cep = jsonResponse['localidade'];
      var log = jsonResponse['logradouro'];
      var comp = jsonResponse['bairro'];
      var city = jsonResponse['uf'];
      
      print(
          
          '${'MEU CEP: ' + cepTFF.text + ' E meu endereço é: ' + cep}-' + city);

      var endereco = cep + '-' + city;
      print('Rua ${log}, Bairro ${comp}, ${cep}-${city}');

      txtU.text = userTFF.text;
      txtE.text = emailTFF.text;
      txtT.text = telTFF.text;
      txtC.text = log;
      txtB.text = 'Bairro: ${comp}';
      txtCi.text = endereco;

      dados =
          'Nome: ${txtU.text}, Email: ${txtE.text}, Telefone: ${txtT.text}, Endereço: ${txtC.text} ${txtB.text} ${txtCi.text}';
      entries.add(dados);
      // dados = '';
      print(entries);

      userTFF.text = "";
      emailTFF.text = "";
      telTFF.text = "";
      cepTFF.text = "";
    } else {
      print(
          'Não é possivel fazer a requisição para o servidor! Error:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 50, top: 50),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.purple,
              ),
              child: const Icon(Icons.add_a_photo)),
          SizedBox(
            child: Container(
              margin: EdgeInsets.only(left: 50, top: 5),
              width: 300,
              child: TextField(
                controller: userTFF,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira um nome de usuário',
                ),
              ),
            ),
          ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.only(left: 50, top: 5),
              width: 300,
              child: TextField(
                controller: emailTFF,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira um email',
                ),
              ),
            ),
          ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.only(left: 50, top: 5),
              width: 300,
              child: TextField(
                controller: telTFF,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira um número de Telefone',
                ),
              ),
            ),
          ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.only(left: 50, top: 5),
              width: 300,
              child: TextField(
                controller: cepTFF,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira um CEP',
                ),
              ),
            ),
          ),
          SizedBox(
              child: Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.only(left: 50, top: 15),
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.purple),
                  child: Center(
                    child: Column(
                      children: [
                        TextField(
                          enabled: false,
                          controller: txtU,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              hintText: 'User', border: InputBorder.none),
                        ),
                        TextField(
                          enabled: false,
                          controller: txtE,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              hintText: 'Email', border: InputBorder.none),
                        ),
                        TextField(
                          enabled: false,
                          controller: txtT,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              hintText: 'Telefone', border: InputBorder.none),
                        ),
                        TextField(
                          enabled: false,
                          controller: txtC,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              hintText: 'Endereço', border: InputBorder.none),
                        ),
                        TextField(
                          enabled: false,
                          controller: txtB,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              hintText: '', border: InputBorder.none),
                        ),
                        TextField(
                          enabled: false,
                          controller: txtCi,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                              hintText: '', border: InputBorder.none),
                        )
                      ],
                    ),
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getCEP,
        tooltip: 'Procurar',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
