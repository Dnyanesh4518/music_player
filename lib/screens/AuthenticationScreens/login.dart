import 'package:flutter/material.dart';
import 'package:music_player/screens/AuthenticationScreens/Signup.dart';
import '../../Custom Widgets/CustomWidgets.dart';
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("lib/assets/images/music-794506_1920.jpg")
            )
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.symmetric(vertical: 10),child:Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: const Image(image: AssetImage("lib/assets/images/headphone-removebg-preview.png"),fit: BoxFit.cover,),
              ),),
              customTextField("Name","Name",TextInputType.text,false),
              customTextField("Password","Password",TextInputType.visiblePassword,true),
              Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
            width: MediaQuery.of(context).size.width,
            child:
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Login"),
              ),
              onPressed:(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                  return const SignUpPage();
                }));
              },
            ),
          ),
              TextButton(onPressed:(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                  return const SignUpPage();
                }));
              }, child:const Text("Don't Have Account SignUp",style: TextStyle(color: Colors.pinkAccent,fontSize: 16,fontWeight: FontWeight.w400),)),

            ],
          ),
        ),
      ),
    );
  }
}
