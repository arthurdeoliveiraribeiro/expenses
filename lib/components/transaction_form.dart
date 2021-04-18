import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionForm extends StatefulWidget {

  final void Function(String, double, DateTime) onSubmit;//Quando clicar no botão

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate  = DateTime.now();

  _submitForm(){
      final title =  _titleController.text;
      final value = double.tryParse(_valueController.text) ?? 0.0;
      
      if(title.isEmpty || value<0 || value > 2000){
        return;
      }
      //Criando um método para validar na hora de apertar o botão
      widget.onSubmit(title,value,_selectedDate);
      //Passei meu submit para quando eu der onPressed, eu passo o valor e o titulo
  
  }
  _showDatePicker(){
    showDatePicker(
      context:context , 
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      //Aparecer a data 
    ).then((pickedDate){
      if(pickedDate ==null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        //Mostra que um dado foi altera e isso deve ocorrer na tela
      });
      //Vai receber o que o usuário marcou de data 
    });
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
                controller: _titleController,//pegar o valor que foi passado lá ,
                //onSubmitted: (titulo) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Título',
                  
                  //O que vai aparecer de informação para o usuário digitar 
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //onSubmitted: (value) => _submitForm(),//Passando a função para quando eu terminar de digitar o valor 
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                  //O que vai aparecer de informação para o usuário digitar 
                ),
                //Onde o usuário pode digitar 
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>
                  [
                    Text( _selectedDate == null? 'Nenhuma data selecionada!': DateFormat('dd/MM/y').format(_selectedDate) ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Selecionar Data', style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                      ),
                      onPressed: _showDatePicker,
                      )
                  ],
                
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Nova transação'),
                    color: Theme.of(context).primaryColor,         
                    textColor: Colors.white,
                    onPressed : _submitForm,               
                  )
                ]
              )   
            ],
          ),
        ),
      );
  }
}