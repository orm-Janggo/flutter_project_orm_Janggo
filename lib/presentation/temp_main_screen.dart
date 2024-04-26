import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/authentication/authentication.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_state.dart';
import 'package:provider/provider.dart';

class TempMainScreen extends StatelessWidget {
  const TempMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignState>(
      builder: (context, appState, _) => AuthFunc(
          loggedIn: appState.loggedIn,
          signOut: () {
            FirebaseAuth.instance.signOut();
          }),
    );
  }
}
