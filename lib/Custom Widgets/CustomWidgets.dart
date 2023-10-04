import 'package:flutter/material.dart';
Widget customTextField(String fieldLabel,String hint,TextInputType keyboardType,bool isPassword)
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
    child: TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        disabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(28),borderSide: const BorderSide(color: Colors.black,width: 5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28),borderSide: const BorderSide(color: Colors.black,width: 5)),
        floatingLabelStyle: const TextStyle(color: Colors.pinkAccent),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.pinkAccent,
          ),
              borderRadius: BorderRadius.circular(28)
        ),
        label: Text(fieldLabel),
        hintText:hint,
      ),
    ),
  );
}


