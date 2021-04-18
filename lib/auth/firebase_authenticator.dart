import 'package:firebase_auth/firebase_auth.dart';
import '../resources/strings.dart';

class FirebaseAuthenticator {
  bool isSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  void userState({Function(bool) state}) {
    final isSigned = isSignedIn();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      final isLoggedIn = user != null;
      state(isLoggedIn != isSigned);
    });
  }

  Future<String> createUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _parseFirebaseExpection(e);
    } catch (e) {
      return Strings.commonErrorMessage;
    }
  }

  Future<String> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _parseFirebaseExpection(e);
    } catch (e) {
      return Strings.commonErrorMessage;
    }
  }

  String _parseFirebaseExpection(FirebaseAuthException e) {
    if (e.message == 'weak-password') {
      return Strings.weakPassword;
    } else if (e.code == 'email-already-in-use') {
      return Strings.inUseEmail;
    } else if (e.code == 'user-not-found') {
      return Strings.userNotFound;
    } else if (e.code == 'wrong-password') {
      return Strings.wrongPassword;
    }
    return Strings.commonErrorMessage;
  }
}
