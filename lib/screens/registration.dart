import 'package:flutter/material.dart';

import '../Custom Widgets/CustomWidgets.dart';
import 'MainScreen.dart';
class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("lib/assets/images/music-794506_1920.jpg"),
              fit:BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10),child:Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image(image: AssetImage("lib/assets/images/headphone-removebg-preview.png"),fit: BoxFit.cover,),
              ),),
              CustomTextField("Name","Name",TextInputType.name,false),
              CustomTextField("Email","Email",TextInputType.emailAddress,false),
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
                    child: Text("Sign Up"),
                  ),
                  onPressed:(){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                      return MainScreen();
                    }));
                  },
                ),
              ),
              // TextButton(onPressed:(){
              //   Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
              //     return SignUpPage();
              //   }));
              // }, child:Text("Dont Have Account SignUp",style: TextStyle(color: Colors.pinkAccent,fontSize: 16,fontWeight: FontWeight.w400),)),

            ],
          ),
        ),
      ),
    );
  }
}
