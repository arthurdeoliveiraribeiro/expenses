import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';
import 'adaptative_date_picker.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,//pegar o valor que foi passado lá ,
                onSubmitted: (titulo) => _submitForm(),
                label: 'Título'
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //onSubmitted: (value) => _submitForm(),//Passando a função para quando eu terminar de digitar o valor 
                //  
                  label: 'Valor (R\$)',
                  onSubmitted: (_) =>_submitForm(),
                  //O que vai aparecer de informação para o usuário digitar 
                //Onde o usuário pode digitar 
              ),
             AdaptatibeDatePicker(
               selectedDate: _selectedDate,
               onDateChanged: (newDate){
                 setState(() {
                   _selectedDate = newDate;
                 });
               } 

             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova transação',
                    onpressed: _submitForm ,
                  )
                  
                ]
              )   
            ],
          ),
        ),
      );
  }
}