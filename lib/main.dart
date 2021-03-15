import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components./transaction_list.dart';
import 'models/transaction.dart';

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

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de corrida',
        value: 310.76,
        date: DateTime.now() //pegando a data atual

        ),
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
  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_){
        return TransactionForm(null);
      }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          //Adicionando botão de adicionar
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () =>_openTransactionFormModal(context),
          )
        ],
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
              TransactionList(_transactions),   
              
            
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
