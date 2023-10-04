import 'package:flutter/material.dart';
import 'package:music_player/screens/AuthenticationScreens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 2,
            titleTextStyle:TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(6.0),
             backgroundColor:Colors.pinkAccent,
            textStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(28))
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color:Colors.pinkAccent)
          )
        ),
      ),
      darkTheme:ThemeData(
        appBarTheme:  AppBarTheme(
            backgroundColor: Colors.grey.shade700,
            elevation: 0,
            titleTextStyle:const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(6.0),
                backgroundColor:Colors.black,
                textStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(28))
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(color:Colors.white)
            )
        ),
      ),
      home:const SignUpPage(),
    );
  }
}