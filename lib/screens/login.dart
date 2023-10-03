import 'package:flutter/material.dart';
import 'package:music_player/screens/Signup.dart';

import '../Custom Widgets/CustomWidgets.dart';
import 'MainScreen.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("lib/assets/images/music-794506_1920.jpg")
            )
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10),child:Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image(image: AssetImage("lib/assets/images/headphone-removebg-preview.png"),fit: BoxFit.cover,),
              ),),
              CustomTextField("Name","Name",TextInputType.text,false),
              CustomTextField("Password","Password",TextInputType.visiblePassword,true),
              Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            ),
            child:
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Login"),
              ),
              onPressed:(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                  return MainScreen();
                }));
              },
            ),
          ),




              TextButton(onPressed:(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                  return SignUpPage();
                }));
              }, child:Text("Dont Have Account SignUp",style: TextStyle(color: Colors.pinkAccent,fontSize: 16,fontWeight: FontWeight.w400),)),

            ],
          ),
        ),
      ),
    );
  }
}
