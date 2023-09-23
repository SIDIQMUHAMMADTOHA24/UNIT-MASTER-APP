// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/login/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final BuildContext context;
  LoginController({
    required this.context,
  });
  void handleLogin() async {
    final state = context.read<LoginBloc>().state;
    String email = state.email;
    String password = state.password;
    if (email.isEmpty) {
      print('Email kosong');
      return;
    }
    if (password.isEmpty) {
      print('Password Kosong');
    }
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      if (user == null) {
        print('pengguna tidak ditemukan');
      }
      if (user != null) {
        Global.storageService.setBool('login', true);
        //handle when login succesfull
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        // Handle kesalahan ketika pengguna tidak ditemukan
      } else if (error.code == 'wrong-password') {
        // Handle kesalahan ketika kata sandi salah
      } else if (error.code == 'invalid-email') {
      } else {
        // Handle kesalahan lainnya
        print('Terjadi kesalahan: ${error.code}');
      }
    }
  }

  Future<User?> loginWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignIn == null) {
        return null;
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(authCredential);
      final User? user = userCredential.user;
      if (user != null) {
        Global.storageService.setBool('login', true);
        Navigator.pushReplacementNamed(context, '/home');
      }
      return user;
    } catch (e) {
      return null;
    }
  }
}
