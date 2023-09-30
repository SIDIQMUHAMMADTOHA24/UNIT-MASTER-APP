import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                menuItem(context, image: 'suhu', title: 'Konversi Suhu')
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
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset('assets/$image.png',
                color: Colors.black.withOpacity(0.8), fit: BoxFit.cover,width: 50,),
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
