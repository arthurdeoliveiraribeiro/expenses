
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de corrida',
        value: 310.76,
        date: DateTime.now() //pegando a data atual

        ),
    Transaction(
        id: 't2',
        title: 'Nova camisa de time',
        value: 150.00,
        date: DateTime.now())
    //Falando que aqui é uma lista de transações
  ];

  //Isso tudo é flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Grafico'),
                //CARD
              ),
            ),
          TransactionList(_transactions),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,//pegar o valor que foi passado lá ,
                    decoration: InputDecoration(
                      labelText: 'Título',
                      //O que vai aparecer de informação para o usuário digitar 
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                      //O que vai aparecer de informação para o usuário digitar 
                    ),
                    //Onde o usuário pode digitar 
                  ),
                  FlatButton(
                  
                    child: Text('Nova transação'),
                    color: Colors.blue[50],
                    textColor: Colors.purple[300],
                    onPressed: (){
                        print(titleController);
                        
                    }                   
                  )
                ],
              ),
            ),
          )
        ]
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
