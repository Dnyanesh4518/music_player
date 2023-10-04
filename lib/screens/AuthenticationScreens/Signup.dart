import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Methods/AuthMethods/Auth.dart';
import 'package:music_player/screens/AuthenticationScreens/login.dart';
import 'package:music_player/screens/AuthenticationScreens/registration.dart';
import 'package:music_player/screens/MainScreen.dart';
import 'package:music_player/screens/Search.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  SignInAuthentication authentication=SignInAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black45, Colors.teal, Colors.black45],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                tileMode: TileMode.clamp),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 100),child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 370,
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
                        child:InkWell(
                          onTap: ()async{
                          User? myuser=await authentication.signInWithGoogle(context:context);
                            if(myuser!=null)
                              {
                                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                                  return SearchScreen(user: myuser,);
                                }));
                              }
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade300,
                                  child: Image.asset("lib/assets/images/google_logo-removebg-preview.png")),
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("Sign In with Google",style: TextStyle(color:Colors.black,letterSpacing: 1),),
                              )
                             ],
                          ),
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
                        child: Text("Sign Up",style: TextStyle(letterSpacing: 1),),
                      ),
                      onPressed:(){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                          return Registration();
                        }));
                      },
                    ),
                  ),
                  TextButton(
                      onPressed:(){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
                      return LoginPage();
                    }));
                  }, child:Text("Already a user !",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400,letterSpacing: 1),)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
