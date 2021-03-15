import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
import '../models/transaction.dart';

class  TransactionUser  extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override

  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de corrida',
        value: 310.76,
        date: DateTime.now() //pegando a data atual

        ),
    Transaction(
        id: 't2',
        title: 'Nova camisa de time23',
        value: 150.00,
        date: DateTime.now())
    //Falando que aqui é uma lista de transações
  ];

  _addTrasanction(String title, double value){
    //Classe onde eu estou adicionando uma nova transação 
    
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now()
      //Passando os atributos
    );
    setState(() {
      _transactions.add(newTransaction);
      //Passando o que eu vou adicionar para a minha lista 
    });
  }


  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTrasanction)
      ]
    );
  }
}