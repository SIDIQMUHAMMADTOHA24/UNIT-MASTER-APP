import 'package:conversion_app/view/login/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(),
            Positioned(
              top: -30.h,
              right: 80.w,
              child: Hero(
                tag: 'circle_avatar1',
                child: Container(
                  height: 500.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent.shade400,
                      borderRadius: BorderRadius.circular(360)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.h,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      'Login menggunakan email atau username',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 53.h,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(left: 70, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          fieldForSign(
                            title: 'Email atau Username',
                            onChanged: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(EmailEvent(email: value));
                            },
                          ),
                          Divider(
                            height: 2.h,
                          ),
                          fieldForSign(
                            title: 'Password',
                            onChanged: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(PasswordEvent(password: value));
                            },
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          LoginController(context: context).handleLogin(),
                      child: Container(
                        margin: const EdgeInsets.only(left: 70, top: 30),
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.5)),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => forgotPassword(context),
                      child: Padding(
                        padding: EdgeInsets.only(left: 220.w, top: 50),
                        child: Text(
                          'Lupa Password',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black.withOpacity(0.7),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Center(
                      child: Text(
                        'Login dengan google atau buat akun baru',
                        style: TextStyle(
                            fontSize: 15.sp, color: Colors.blue.shade500),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonThreeParty(context,
                            name: 'Google', images: 'google'),
                        buttonThreeParty(context,
                            name: 'Akun Baru', images: 'user'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ));
  }

  Widget fieldForSign(
      {required String title, required void Function(String value) onChanged}) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      obscureText: (title == 'Password') ? true : false,
      obscuringCharacter: '•',
      decoration: InputDecoration(
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: title,
          hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey),
          contentPadding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
          constraints: BoxConstraints(maxHeight: 60.h)),
    );
  }

  Widget buttonThreeParty(BuildContext context,
      {required String name, required String images}) {
    return GestureDetector(
      onTap: () {
        if (images == 'user') {
          Navigator.pushNamed(context, '/register');
        }
        

        if (images == 'google') {
          LoginController(context: context).loginWithGoogle();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 50.h,
        width: 106.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 20.h,
                child: Image.asset(
                  'assets/$images.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 10.w,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7), fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }

  void forgotPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        buttonPadding: const EdgeInsets.all(10),
        title: const Text(
          'Masalah Login ?',
          textAlign: TextAlign.center,
        ),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.8),
        ),
        content: SingleChildScrollView(
          child: Column(children: [
            Text(
              'Masukan email anda dan kami akan mengirimkan link untuk kembali ke account anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Masukan email anda',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.9),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey.withOpacity(0.7))),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey.withOpacity(0.7))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.grey.withOpacity(0.7))))),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 35.h,
              decoration: BoxDecoration(
                  color: Colors.amberAccent.shade400,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                'Kirim',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 15.sp),
              )),
            )
          ]),
        ),
      ),
    );
  }
}
