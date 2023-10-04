import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_player/screens/AuthenticationScreens/Signup.dart';
class SignInAuthentication{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if(googleSignInAccount!=null)
    {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );

      try
      {
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        user = userCredential.user;
      }
      on FirebaseAuthException catch(e)
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.message.toString())));
      }
    }
    return user;
  }
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){
      return SignUpPage();
    }));
  }

}