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
                //Não importa quantas vezes eu coloque um elemento na lista sempre vai ter mais, pois usei uma função map para aparecer a lista e dar estilo tela, muito massa 
              return Card(
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',//Passando no container o valor e transformando em string
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                        )
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,//Colocar no inicio da tela alinhado,
                    children: <Widget>[
                      Text(
                        tr.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          color: Colors.grey[500]
                        ),
                        
                        )
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

/*
Container recebe apenas uma lista de Widget como filho 
Alinhamento flexível e opções de estilo 
Largura fexível(largura do filho, largura disponiveel)

Column / Row aceita uma lista de widgets como filho
Alinhamento, mas sem opção de estilo
Sempre ocupa toda altura(Column)
Sempre ocupa toda largura(Row)


*/
