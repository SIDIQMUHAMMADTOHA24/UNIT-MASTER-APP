import 'package:conversion_app/common/constant/constant.dart';
import 'package:conversion_app/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final user = Global.storageService.getUserInfo();
  final logout = FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  user['imageUrl'],
                  width: 70,
                )),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Halo ${user['userEmail']}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(
              height: 40,
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Keluar',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
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
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  });
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          title: Text(
            'Conversion App',
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.8)),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 50),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                menuItem(context, image: 'length', title: 'Konversi Panjang'),
                menuItem(context, image: 'massa', title: 'Konversi Massa'),
                menuItem(context, image: 'suhu', title: 'Konversi Suhu'),
                menuItem(context, image: 'time', title: 'Konversi Waktu'),
              ],
            )));
  }

  Widget menuItem(BuildContext context,
      {required String image, required String title}) {
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
              color: Colors.black.withOpacity(0.8),
              fit: BoxFit.cover,
              width: 50,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
