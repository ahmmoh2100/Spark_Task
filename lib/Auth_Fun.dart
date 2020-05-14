import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future registerWithEmailAndPass(String email, String password) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (result != null) {
      return result.user.email;
    }
  } catch (e) {
    return null;
  }
}

Future loginWithEmailAndPassword(String email, String password) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (result != null) {
      return result.user.email;
    }
  } catch (e) {
    return null;
  }
}
