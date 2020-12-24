import 'package:firebase_auth/firebase_auth.dart';

/// This service class is a warper to Firebase Auth API.
///
/// used to get used authenticted
class AuthService {
  /// [FirebaseAuth] instance used to call API functions
  final FirebaseAuth _fai = FirebaseAuth.instance;

  // auth change user stream
  Stream<User> get userStream {
    return _fai.authStateChanges();
  }

  // auth change user stream
  User get user {
    return _fai.currentUser;
  }

  String get userId {
    return user.uid;
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fai.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fai.createUserWithEmailAndPassword(
          email: email, password: password);

      return result.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _fai.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
