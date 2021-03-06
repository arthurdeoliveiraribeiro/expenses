import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'components/chart.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
    ]
    );
     
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Opensans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  Widget _getIconButton(IconData icon, Function fn){

    return Platform.isIOS?
      GestureDetector(onTap: fn,child: Icon(icon)):
      IconButton(
            icon: Icon(icon),
            onPressed: fn
    );

  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final iconList = Platform.isIOS? CupertinoIcons.refresh: Icons.list;
    final chartList = Platform.isIOS? CupertinoIcons.refresh: Icons.show_chart;


    final acations = <Widget>[

          _getIconButton(
            _showChart? iconList: chartList,
            (){
              setState(() {
                _showChart = !_showChart;
              });
            },
            ),
          _getIconButton(
             Platform.isIOS ? CupertinoIcons.add: Icons.add,
            () =>_openTransactionFormModal(context),
            ),

        ];

    final PreferredSizeWidget appBar =  Platform.isIOS? 
    CupertinoNavigationBar(
      middle: Text('Depesas Pessoais'),
      
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: 
        acations
      ,),
         
    )
    :AppBar(
        title: Text('Depesas Pessoais',
          
        ),
        actions: acations,
      );

    final availablelHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;
    final bodypage = SafeArea(child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          
            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Exibir gr??fico'),
                Switch.adaptive(
                  value: _showChart, 
                  onChanged: (value){
                    setState(() {
                      _showChart = value;
                    });
                  }
                ),
              ],
            ),
            */
            //Para adaptar a plataforma
          
            _showChart?//Se o showChart for verdadeiro ou falso
            Container(
              height: availablelHeight * ( 0.25),
              child: Chart(_recentTransactions)
            ):
            //Ou exibo o de cima ou o de baixo
            Container(
              height: availablelHeight * 0.75,
              child: TransactionList(_transactions, _removeTransaction)
            ),
          ],
        ),
      )
    );

    return  Platform.isIOS ? 
    CupertinoPageScaffold(
      navigationBar: appBar,
      child: bodypage
    
    ,) :
      Scaffold(
      appBar: appBar,
      body: bodypage,

      floatingActionButton:  Platform.isIOS? Container(

      )
      : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
