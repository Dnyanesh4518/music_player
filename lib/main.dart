import 'package:flutter/material.dart';
import 'package:music_player/screens/Search.dart';
import 'package:music_player/screens/Signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pinkAccent,
          elevation: 0,
            titleTextStyle:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(6.0),
             backgroundColor:Colors.pinkAccent,
            textStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(28))
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color:Colors.pinkAccent)
          )
        ),
        // colorScheme: const ColorScheme.light(brightness: Brightness.light,background:Colors.white,),
      ),
      home: const SearchScreen(),
    );
  }
}