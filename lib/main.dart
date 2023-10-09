import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/AuthenticationScreens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:music_player/screens/Search.dart';
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
      home:StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active)
            {
              User? user= snapshot.data;
             return SearchScreen(user: user);
            }
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator(color: Colors.blueAccent,semanticsLabel:"Signing you in"),);
            }
          if(snapshot.hasError)
            {
              return const ScaffoldMessenger(child: SnackBar(content:Text("Something went wrong"),));
            }
          else {
            return const SignUpPage();
          }
        },

      ),
    );
  }
}