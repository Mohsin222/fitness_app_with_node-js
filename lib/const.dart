import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration textField_decoration= InputDecoration(hintText: 'Search',
    hintStyle: TextStyle(fontSize: 20,color: Colors.white),
  labelText: 'Search',
  labelStyle: TextStyle(fontSize: 20,color: Colors.white),
           border: OutlineInputBorder(
            borderSide:const BorderSide(width: 3,color: Colors.blue),
             
           borderRadius: BorderRadius.circular(20)
           ),
               enabledBorder: OutlineInputBorder(
            borderSide:const BorderSide(width: 3,color: Colors.blue),
             
           borderRadius: BorderRadius.circular(20)
           ),
               focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 3,color: Colors.red),
           
           borderRadius: BorderRadius.circular(20)),
       
    );