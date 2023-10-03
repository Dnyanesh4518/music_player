import 'package:flutter/material.dart';
import 'package:music_player/Custom%20Widgets/CustomWidgets.dart';
import 'package:music_player/screens/login.dart';
import 'package:music_player/screens/registration.dart';

import 'MainScreen.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("lib/assets/images/music-794506_1920.jpg"),
            )
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Image(image: AssetImage("lib/assets/images/headphone-removebg-preview.png"),fit: BoxFit.cover,),
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
                    child: ElevatedButton(onPressed:(){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(6.0),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(28),side: BorderSide(color: Colors.black))
                        ),
                        child:Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                                child: Image.asset("lib/assets/images/google_logo-removebg-preview.png")),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text("Sign In with Google",style: TextStyle(color:Colors.black),),
                            )
                           ],
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                    ),
                    child:
                    ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Sign Up"),
                      ),
                      onPressed:(){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                          return Registration();
                        }));
                      },
                    ),
                  ),
                  TextButton(onPressed:(){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                      return LoginPage();
                    }));
                  }, child:Text("Already a user !",style: TextStyle(color: Colors.pinkAccent,fontSize: 16,fontWeight: FontWeight.w400),)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
