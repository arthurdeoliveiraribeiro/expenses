import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_user.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  //Isso tudo é flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  child: Text('Grafico'),
                  //CARD
                ),
              ),
            TransactionUser()
            
          ]
        ),
      ),
    );
  }
}

/*
Container recebe apenas uma lista de Widget como filho 
Alinhamento flexível e opções de estilo 
Largura fexível(largura do filho, largura disponiveel)

Column / Row aceita uma lista de widgets como filho
Alinhamento, mas sem opção de estilo
Sempre ocupa toda altura(Column)
Sempre ocupa toda largura(Row)


*/
