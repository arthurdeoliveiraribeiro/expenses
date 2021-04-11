import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function (String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty?Column(
          //Caso a minha lista esteja vazia 
          children: <Widget>[
            Text(
              'nenhuma transação cadastrada',   
              style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
            ),
            Container(
              
              height:250,
              width: 310,
              child:Image.asset(
                'assets/imagens/waiting.png',
                 fit: BoxFit.cover,
              ),
            ),
          ],
      ) 
      :ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return 
            Card(
              //Transformando cada elemento da lista em um card 
              elevation: 5,
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5
              ),
              child :ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(
                      child: Text('R\$${tr.value}')
                    ),
                  ),
                ),
                title: Text(
                  tr.title,
                  style: Theme.of(context).textTheme.title,
                  //Aqui eu passei o titulo 
                  
                ),
                subtitle: Text(
                  DateFormat('d MMM y').format(tr.date)
                  //No subtitulo eu passie a data 
                ),
                trailing: IconButton(
                  icon:Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => onRemove(tr.id)
                  //removendo da lista

                 ,),
              ),
          );
        },
      ),
    );
  }
}
