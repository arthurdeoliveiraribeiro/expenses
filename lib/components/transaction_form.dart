import 'package:flutter/material.dart';
class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;//Quando clicar no botão

  TransactionForm(this.onSubmit);

  _submitForm(){
      final title = titleController.text;
      final value = double.tryParse(valueController.text) ?? 0.0;
      
      if(title.isEmpty || value<0){
        return;
      }
      //Criando um método para validar na hora de apertar o botão
      onSubmit(title,value);
      //Passei meu submit para quando eu der onPressed, eu passo o valor e o titulo
  
  }

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
                    //onSubmitted: (titulo) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Título',
                      
                      //O que vai aparecer de informação para o usuário digitar 
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    //onSubmitted: (value) => _submitForm(),//Passando a função para quando eu terminar de digitar o valor 
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
                        _submitForm();
                        
                    }                   
                  )
                ],
              ),
            ),
          );
  }
}