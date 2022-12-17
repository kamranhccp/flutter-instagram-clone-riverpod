import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_clone_kamranhccp/state/posts/typedef/user_id.dart';

import '../constants/constants.dart';
import '../models/auth_results.dart';

class Authenticator {
  const Authenticator();
  // get current user
  User? get currentUser => FirebaseAuth.instance.currentUser;

  // user getter that gets the user current userID and returns the user id
  UserId? get userID => currentUser?.uid;

  // Extra: Get User Credentials Details - Ft. Profile Data
  // String? get userName => currentUser?.displayName;
  // String? get userEmail => currentUser?.email;
  // we check if user is already logged in
  // as long as userID is not null then user is logged in
  bool isAlreadyLoggedIn() => userID != null;

  // get displayName that gets the current user name
  String get displayName => currentUser?.displayName ?? '';

  // get email that gets the current user email
  // 1. get currentUser or
  // 2. can also do FirebaseUser? get currentUser => FirebaseAuth.instance.currentUser;
  String? get email => FirebaseAuth.instance.currentUser?.email ?? '';

  // also we are writing three functions
  // 1. is for logout
  // 2. is for login with facebook
  // 3. is for login with google
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  Future<AuthResults> loginWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;
    if (token == null) {
      // means user has aborted the login process
      return AuthResults.aborted;
    }
    // get credentials from facebook
    final oAuthCredentials = FacebookAuthProvider.credential(token);

    try {
      await FirebaseAuth.instance.signInWithCredential(
        oAuthCredentials,
      );
      return AuthResults
          .success; // if oAuthCredentials is successful returns success
    } on FirebaseAuthException catch (e) {
      // if you already have an account with the same email using google or facebook
      final email = e.email;
      final credential = e.credential;
      if (e.code == Constants.accountAlreadyExistsWithDifferentCredentials &&
          email != null &&
          credential != null) {
        final providers =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(
          email,
        );
        if (providers.contains(Constants.googleCom)) {
          await loginWithGoogle(); // if already have an account with google
          FirebaseAuth.instance.currentUser?.linkWithCredential(
            // link these two credentials together
            credential,
          );
        }
        return AuthResults.success;
      }
      return AuthResults.failure;
    }
  }

  Future<AuthResults> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        Constants.emailScope,
      ],
    );
    final signInAccount =
        await googleSignIn.signIn(); // will show googleSignIn dialog to user
    if (signInAccount == null) {
      return AuthResults.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oAuthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oAuthCredentials,
      );
      return AuthResults.success;
    } on FirebaseAuthException catch (e) {
      return AuthResults.failure;
    }
  }
}
