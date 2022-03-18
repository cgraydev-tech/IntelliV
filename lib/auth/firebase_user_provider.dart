import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IntelliVFirebaseUser {
  IntelliVFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

IntelliVFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IntelliVFirebaseUser> intelliVFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IntelliVFirebaseUser>(
            (user) => currentUser = IntelliVFirebaseUser(user));
