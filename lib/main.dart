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
      home: MyHomePage(),
      //Passsando o tema para aplicação
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber[300],
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18
            )
          ) 
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction>_transactions = [
  Transaction(
        id: 't1',
        title: 'Novo Tênis de corrida',
        value: 310.76,
        date: DateTime.now().subtract(Duration(days: 3)) //pegando a data atual

        ),
        Transaction(
        id: 't1',
        title: 'Novo Tênis de corrida',
        value: 310.76,
        date: DateTime.now().subtract(Duration(days: 5)) //pegando a data atual

        ),
        
    Transaction(
        id: 't2',
        title: 'Nova camisa de time23',
        value: 150.00,
        date: DateTime.now())
    
    //Falando que aqui é uma lista de transações
  ];

  List<Transaction> get _recentTransactions{
    return _transactions.whereType()
  }
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
    Navigator.of(context).pop();//pop serve para fechar a tela 
    //Assim que eu apertar em salvar 

    //Para fechar o modal
  }
  _openTransactionFormModal(BuildContext context){
    //Abrindo o modal
    showModalBottomSheet(
      context: context,
      builder: (_){
        return TransactionForm(_addTrasanction);
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
            onPressed: () =>_openTransactionFormModal(context)//Abrindo o modal,
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
