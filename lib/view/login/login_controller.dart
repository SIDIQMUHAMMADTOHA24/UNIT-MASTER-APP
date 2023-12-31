// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:conversion_app/common/constant/constant.dart';
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      final user = credential.user;
      if (user == null) {
        print('user null');
      }
      if (user != null) {
        Global.storageService.saveUserInfo(
          userId: user.uid,
          email: user.email!,
        );
        Global.storageService
            .setString(AppConstant.STORAGE_USER_TOKEN_KEY, '12345678');
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
    try {
      final auth = FirebaseAuth.instance;

      // Logout pengguna sebelum login dengan Google
      await GoogleSignIn().signOut();

      // Meminta pengguna untuk login dengan akun Google
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Membuat credential GoogleAuthProvider
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      // Melakukan login ke Firebase dengan credential
      final UserCredential user = await auth.signInWithCredential(credential);
      print(user);
      if (user.user != null) {
        // // Menyimpan informasi pengguna ke penyimpanan
        Global.storageService.saveUserInfo(
          userId: user.user!.uid,
          email: user.user!.email!,
        );

        // // Menyimpan token pengguna (ini mungkin akan diganti dengan token yang unik)
        Global.storageService
            .setString(AppConstant.STORAGE_USER_TOKEN_KEY, '12345678');

        // Mengarahkan pengguna ke layar beranda setelah login
        Navigator.pushReplacementNamed(context, '/home');
        return user.user!;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e}');
      return null;
    }
  }

  Future<void> doResetPassword() async {
    final state = context.read<LoginBloc>().state;
    print(state.email);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: state.email.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        // Menangani error jika alamat email tidak valid
        print('Alamat email tidak valid.');
      } else if (e.code == 'auth/missing-android-pkg-name') {
        // Menangani error jika nama paket Android tidak diberikan
        print('Nama paket Android tidak diberikan.');
      } else if (e.code == 'auth/missing-continue-uri') {
        // Menangani error jika URL lanjutan tidak diberikan
        print('URL lanjutan tidak diberikan.');
      } else if (e.code == 'auth/missing-ios-bundle-id') {
        // Menangani error jika ID Bundle iOS tidak diberikan
        print('ID Bundle iOS tidak diberikan.');
      } else if (e.code == 'auth/invalid-continue-uri') {
        // Menangani error jika URL lanjutan tidak valid
        print('URL lanjutan tidak valid.');
      } else if (e.code == 'auth/unauthorized-continue-uri') {
        // Menangani error jika domain URL lanjutan tidak diizinkan
        print('Domain URL lanjutan tidak diizinkan.');
      } else if (e.code == 'auth/user-not-found') {
        // Menangani error jika pengguna tidak ditemukan
        print('Pengguna tidak ditemukan.');
      }
    }
  }
}
