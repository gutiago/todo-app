import 'package:firebase_auth/firebase_auth.dart';

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
}