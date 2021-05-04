import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptatibeDatePicker extends StatelessWidget {

   final DateTime selectedDate;
   final Function (DateTime) onDateChanged;

   AdaptatibeDatePicker({
     this.selectedDate,
     this.onDateChanged
   });
  _showDatePicker(BuildContext context){
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
      onDateChanged(pickedDate);//recebendo a data

    });
  }


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
    Container(
      height: 180,
      child: CupertinoDatePicker (
        mode: CupertinoDatePickerMode.date,
        maximumDate:DateTime.now() ,
        minimumDate: DateTime(2019),
        initialDateTime: DateTime.now(),
        onDateTimeChanged: onDateChanged,
      ),
    ):
    Container(

      height: 70,
      child: Row(
        children: <Widget>
        [
          Text(
            selectedDate == null
              ? 'Nenhuma data selecionada!'
              : DateFormat('dd/MM/y').format(selectedDate)
          ),

          FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text('Selecionar Data', style: TextStyle(
              fontWeight: FontWeight.bold
            )
            ),
            onPressed: () => _showDatePicker(context),
          )
        ],
      ),
    );
  }
}