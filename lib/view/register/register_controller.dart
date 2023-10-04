// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conversion_app/common/constant/constant.dart';
import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({
    required this.context,
  });

  void handleRegister() async {
    final state = context.read<RegisterBloc>().state;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    if (email.isEmpty) {
      //handle if email empety
    }
    if (password.isEmpty) {
      //handle if password empety
    }
    if (confirmPassword.isEmpty) {
      //handle if confirmPassword empety
    }
    if (password == confirmPassword) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.trim(), password: password.trim());
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(email);
        Global.storageService.saveUserInfo(
          userId: credential.user!.uid,
          email: credential.user!.email!,
        );
        Global.storageService
            .setString(AppConstant.STORAGE_USER_TOKEN_KEY, '12345678');
        Navigator.of(context).pushReplacementNamed('/home');
      } on FirebaseAuthException catch (e) {
        print(e.toString());
        if (e.code == 'weak-password') {
          //handle
        } else if (e.code == 'email-already-in-use') {
          //hanlde
        }
      }
    } else if (password != confirmPassword) {
      print('pasword tidak sama');
    }
  }
}
