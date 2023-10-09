import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class SignInAuthentication{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
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
             print(e.message.toString());
      }
    }
    return user;
  }
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

}