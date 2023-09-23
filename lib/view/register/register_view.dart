import 'package:conversion_app/view/login/login_view.dart';
import 'package:conversion_app/view/register/register_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/register_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(),
            Positioned(
              top: -200.h,
              left: -15.w,
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
                      height: 80.h,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
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
                      margin: const EdgeInsets.only(left: 20, right: 70),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          fieldForSign(
                            title: 'Email',
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
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
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(password: value));
                            },
                          ),
                          Divider(
                            height: 2.h,
                          ),
                          fieldForSign(
                            title: 'Confirm Password',
                            onChanged: (value) {
                              context.read<RegisterBloc>().add(
                                  ConfirmPasswordEvent(confirmPassword: value));
                            },
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          RegisterController(context: context).handleRegister(),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top: 30),
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amberAccent.shade400),
                        child: Center(
                          child: Text(
                            'Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Center(
                      child: Text(
                        'Login dengan google atau dengan akun yang sudah ada',
                        textAlign: TextAlign.center,
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
                            name: 'Login', images: 'user'),
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
      {required String title, required Function(String value) onChanged}) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      obscureText:
          (title == 'Password' || title == 'Confirm Password') ? true : false,
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
          Navigator.of(context).pushNamed('/login');
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
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
}
