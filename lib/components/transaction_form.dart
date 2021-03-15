import 'package:flutter/material.dart';
class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;//Quando clicar no botão

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      final title = titleController.text;
                      final value = double.tryParse(valueController.text) ?? 0.0;

                      onSubmit(title,value); 
                      //Passei meu submit para quando eu der onPressed, eu passo o valor e o titulo
                        
                    }                   
                  )
                ],
              ),
            ),
          );
  }
}