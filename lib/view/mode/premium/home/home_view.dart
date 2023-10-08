import 'package:conversion_app/common/constant/constant.dart';
import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/mode/premium/home/bloc/dark_mode_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final user = Global.storageService.getUserInfo();
  final logout = FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, bool>(
      builder: (context, state) {
        final isDarkMode = context.read<DarkModeBloc>().state;
        return Scaffold(
            backgroundColor:
                isDarkMode ? const Color(0xFF121212) : Colors.white,
            drawer: Drawer(
              backgroundColor:
                  isDarkMode ? const Color(0xFF121212) : Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: isDarkMode ? Colors.amber : Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          '${user['userEmail'][0]}',
                          style: TextStyle(
                            color: !isDarkMode
                                ? const Color(0xFFFFFFFF)
                                : Colors.black.withOpacity(0.8),
                            fontSize: 40.sp,
                          ),
                        ))),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Halo ${user['userEmail']}',
                      style: TextStyle(
                          color: isDarkMode
                              ? const Color(0xFFFFFFFF)
                              : Colors.black.withOpacity(0.8),
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        FirebaseAuth.instance.signOut();
                        Global.storageService.remove(AppConstant.EMAIL);
                        Global.storageService.remove(AppConstant.USER_ID);
                        Global.storageService
                            .remove(AppConstant.STORAGE_USER_TOKEN_KEY);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/mode', (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 80),
                        decoration: BoxDecoration(
                            color: isDarkMode ? Colors.amber : Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Keluar',
                          style: TextStyle(
                              color: !isDarkMode
                                  ? const Color(0xFFFFFFFF)
                                  : Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    )
                  ]),
            ),
            appBar: AppBar(
              //untuk mengubah icon drawer
              leading: Builder(
                builder: (context) {
                  return IconButton(
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                      icon: Icon(
                        Icons.menu,
                        color: isDarkMode
                            ? const Color(0xFFFFFFFF)
                            : Colors.black.withOpacity(0.8),
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      });
                },
              ),
              elevation: 0,
              backgroundColor:
                  isDarkMode ? const Color(0xFF121212) : Colors.white,
              toolbarHeight: 80,
              title: Text(
                'Conversion App',
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFFFFFFF)
                        : Colors.black.withOpacity(0.8)),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<DarkModeBloc>().add(DarkModeEvent());
                    },
                    icon: isDarkMode
                        ? const Icon(
                            Icons.wb_sunny_sharp,
                            color: Colors.yellow,
                          )
                        : const Icon(
                            Icons.brightness_2,
                            color: Colors.black,
                          )),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 50),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    menuItem(context,
                        image: 'length',
                        title: 'Konversi Panjang',
                        colorsIconAndText: isDarkMode),
                    menuItem(context,
                        image: 'massa',
                        title: 'Konversi Massa',
                        colorsIconAndText: isDarkMode),
                    menuItem(context,
                        image: 'suhu',
                        title: 'Konversi Suhu',
                        colorsIconAndText: isDarkMode),
                    menuItem(context,
                        image: 'time',
                        title: 'Konversi Waktu',
                        colorsIconAndText: isDarkMode),
                  ],
                )));
      },
    );
  }

  Widget menuItem(BuildContext context,
      {required String image,
      required String title,
      required bool colorsIconAndText}) {
    return GestureDetector(
      onTap: () {
        if (image == 'length') {
          Navigator.pushNamed(context, '/long');
        }
        if (image == 'massa') {
          Navigator.pushNamed(context, '/massa');
        }
        if (image == 'suhu') {
          Navigator.pushNamed(context, '/suhu');
        }
        if (image == 'time') {
          Navigator.pushNamed(context, '/time');
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Image.asset(
              'assets/$image.png',
              color: colorsIconAndText
                  ? const Color(0xFFFFFFFF)
                  : Colors.black.withOpacity(0.8),
              fit: BoxFit.cover,
              width: 50,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: colorsIconAndText
                      ? const Color(0xFFFFFFFF)
                      : Colors.black.withOpacity(0.8)),
            )
          ],
        ),
      ),
    );
  }
}
