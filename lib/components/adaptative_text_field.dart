import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  AdaptativeTextField({
    this.controller,
    this.keyboardType,
    this.onSubmitted
  });
  @override
  Widget build(BuildContext context) {
    return  Platform.isIOS? CupertinoTextField(
      
    ) : TextField(
   
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: 'Valor (R\$)',
        //O que vai aparecer de informação para o usuário digitar 
      ),
      //Onde o usuário pode digitar 
    
    );
  }
}