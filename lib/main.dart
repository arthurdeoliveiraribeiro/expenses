import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Grafico'),
                //CARD
              ),
            ),
            Column(
                children: _transactions.map((tr) {
              return Card(
                child: Row(children: <Widget>[
                  Container(
                      child: Text(tr.value
                              .toString() //Passando no container o valor e transformando em string
                          )
                  ),
                  Column(
                    children: <Widget>[
                      Text(tr.title),
                      Text(tr.date.toString())
                    ],

                  )
                ]),
                //Passando um card com a lista de titulos das transações
                //Mapeamento entre as transações que estão no backlog em elementos visuais na tela
              );
            }).toList() //Convertendo para uma lista,
                )
          ]),
    );
  }
}
