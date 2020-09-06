import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_login/classes/user.dart';
import 'package:simple_login/backend/DBService.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get userStream {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

   //register with email and password
  Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(name, email, password);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
      //await DatabaseService(uid: newUser.uid).updateUserData(false);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}