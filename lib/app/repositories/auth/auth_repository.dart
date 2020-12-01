import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo/app/repositories/auth/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository({@required this.firebaseAuth});

  @override
  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount googleUserAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuthentication =
        await googleUserAccount.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuthentication.accessToken,
      idToken: googleAuthentication.idToken,
    );

    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  User getUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Future logout() {
    return firebaseAuth.signOut();
  }
}
