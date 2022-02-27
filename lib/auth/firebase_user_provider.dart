import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IntelliVV3FirebaseUser {
  IntelliVV3FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

IntelliVV3FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IntelliVV3FirebaseUser> intelliVV3FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IntelliVV3FirebaseUser>(
            (user) => currentUser = IntelliVV3FirebaseUser(user));
