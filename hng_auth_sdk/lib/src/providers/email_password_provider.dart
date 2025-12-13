import 'package:firebase_auth/firebase_auth.dart';
import 'package:hng_auth_sdk/src/providers/auth_provider_base.dart';
import 'package:hng_auth_sdk/src/exceptions/auth_exceptions.dart';

class EmailPasswordProvider implements AuthProviderBase {
  final FirebaseAuth _firebaseAuth;

  EmailPasswordProvider(this._firebaseAuth);

  @override
  Future signIn([String? email, String? password]) async {
    if (email == null || password == null) {
      throw ArgumentError(
        'Email and password are required for email authentication',
      );
    }
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future signUp(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordException(
          e.message ?? 'Password is too weak. Use at least 6 characters',
          true,
        );
      }
      rethrow;
    }
  }

  Future signUpWithWeakPasswordBypass(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        final modifiedPassword = '${password}1!';
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: modifiedPassword,
        );
        return credential.user!;
      }
      rethrow;
    }
  }

  @override
  Future signOut() async {
    await _firebaseAuth.signOut();
  }
}
