import 'dart:io' show Platform;

import 'package:daiary/screens/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static String route = '/Login';
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              minWidth: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 16),
              onPressed: () async {
                await login(context);
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.yellow[700],
              child: Text('Continuar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Start by you.',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Daiary',
                style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Theme.of(context).textTheme.headline6.color),
              ),
            ),
            FadeInImage(
                placeholder: AssetImage(''),
                image: NetworkImage('https://i.ibb.co/WzMmdjP/taxi-diver.png'))
          ],
        ),
      )),
    );
  }

  Future login(BuildContext context) async {
    FirebaseUser user = await signInWithGoogle();
    if (user != null) {
      Navigator.pushReplacementNamed(context, MainPage.route);
    } else {
      showAlert('Ocorreu um erro ao fazer o login, tente novamente',
          () => signInWithGoogle());
    }
  }

  showAlert(String message, Function onClick, {String buttonMessage}) {
    if (Platform.isIOS) {
      showDialog(
          context: context,
          child: CupertinoAlertDialog(
            title: Text(message),
            actions: [
              CupertinoButton(
                child: Text(buttonMessage ?? 'Ok'),
                onPressed: onClick,
              )
            ],
          ));
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text(message),
            actions: [
              FlatButton(
                child: Text(buttonMessage ?? 'OK'),
                onPressed: onClick,
              )
            ],
          ));
    }
  }

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final _auth = FirebaseAuth.instance;
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    return user;
  }
}
