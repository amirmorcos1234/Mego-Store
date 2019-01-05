import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

class FirebaseHelper {
  signIn(email, password) {}
  Future<dynamic> registerUser({name, email, password, photo}) async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (error) {
      return {'message': error.details};
    }
  }

  Future<dynamic> googleSignIn() async {
    try {
      GoogleSignInAccount _account = await _googleSignIn.signIn();
      GoogleSignInAuthentication _authentication =
          await _account.authentication;
      return await FirebaseAuth.instance.signInWithGoogle(
          accessToken: _authentication.accessToken,
          idToken: _authentication.idToken);
    } catch (error) {}
  }

  Future<dynamic> facebookSignIn() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(['email']);
    facebookLogin.loginBehavior = FacebookLoginBehavior.nativeOnly;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        await FirebaseAuth.instance
            .signInWithFacebook(accessToken: result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        // _showCancelledMessage();
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }
}
