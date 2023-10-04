import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/dot_indicator_bloc.dart';
import 'details.dart';

class SelectModeView extends StatefulWidget {
  const SelectModeView({super.key});

  @override
  State<SelectModeView> createState() => _SelectModeViewState();
}

class _SelectModeViewState extends State<SelectModeView> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);
  bool isFirstRun = true;
  int indexDotsIndicator = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<DotIndicatorBloc, DotIndicatorState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 370.h,
              child: PageView.builder(
                onPageChanged: (value) {
                  state.page = value;
                  context.read<DotIndicatorBloc>().add(DotIndicatorEvent());
                },
                itemCount: listDetailsSelectMode.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  indexDotsIndicator = index;
                  return pageView(index);
                },
              ),
            ),
            DotsIndicator(
              position: state.page,
              dotsCount: listDetailsSelectMode.length,
              decorator: DotsDecorator(
                  size: const Size(7, 7),
                  activeSize: const Size(30, 7),
                  color: state.page == 0
                      ? Colors.amberAccent.shade400
                      : Colors.blue.shade500,
                  activeColor: state.page != 0
                      ? Colors.amberAccent.shade400
                      : Colors.blue.shade500,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            )
          ],
        );
      },
    ));
  }

  Widget pageView(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 0.0;
        double delta = 0.0;
        double currentPage = 0.0;

        if (isFirstRun && index != 0.0) {
          value = 0.038; //
          isFirstRun = false;
        } else if (pageController.position.haveDimensions) {
          currentPage = pageController.page ?? 0.0;
          delta = index - currentPage;
          value = (delta * 0.038).clamp(-1, 1);
        }

        return Transform.rotate(
          angle: pi * value,
          child: pageCard(index),
        );
      },
    );
  }

  Widget pageCard(int index) {
    var data = listDetailsSelectMode[index];
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (index == 0) ? Colors.blue.shade500 : Colors.white,
              border: index == 1
                  ? Border.all(
                      color: Colors.amberAccent.shade400,
                      width: 5.w,
                    )
                  : Border.all(color: Colors.transparent),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10)
              ]),
          height: 400.h,
          width: 300.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (index == 0) ? resaultModeGratis(data) : resaultModePremium(data)
            ],
          ),
        ),
        if (index == 1)
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
                height: 70.h,
                width: 70.w,
                child: Image.asset('assets/crown.png')),
          )
        else
          Container(),
      ],
    );
  }

  Widget resaultModeGratis(CardMode data) {
    return Column(
      children: [
        SizedBox(
          height: 145.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.benefit[0],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 135.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                data.benefit[1],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 60.sp),
              )
            ],
          ),
        ),
        Text(
          data.benefit[2],
          style: TextStyle(
              color: Colors.white,
              fontSize: 35.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30.h,
        ),
        const Divider(
          color: Colors.white,
          thickness: 0.7,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/gratis');
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     buttonPadding: const EdgeInsets.all(10),
            //     title: const Text(
            //       'Peringatan',
            //       textAlign: TextAlign.center,
            //     ),
            //     titleTextStyle: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black.withOpacity(0.8),
            //     ),
            //     content: SingleChildScrollView(
            //       child: Column(children: [
            //         Text(
            //           'Untuk saat ini mode gratis masih dalam pengembangan, gunakan mode premium untuk masuk ke aplikasi',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //               color: Colors.grey.withOpacity(0.9),
            //               fontWeight: FontWeight.w400),
            //         ),
            //       ]),
            //     ),
            //   ),
            // );
          },
          child: SizedBox(
            height: 85.h,
            child: Center(
              child: Text(
                data.buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget resaultModePremium(CardMode data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Akses ke',
          style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              benefitForPremium(benefit: data.benefit[0]),
              SizedBox(
                height: 5.h,
              ),
              benefitForPremium(benefit: data.benefit[1]),
              SizedBox(
                height: 5.h,
              ),
              benefitForPremium(benefit: data.benefit[2]),
              SizedBox(
                height: 5.h,
              ),
              benefitForPremium(benefit: data.benefit[3]),
              SizedBox(
                height: 35.h,
              ),
              Text(
                data.requiredPremium,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue.shade500,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () async {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (route) => false);
          },
          child: Container(
            height: 85.h,
            color: Colors.amberAccent.shade400,
            child: Center(
              child: Text(
                data.buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget benefitForPremium({required String benefit}) {
    return Row(
      children: [
        SizedBox(height: 20.h, child: Image.asset('assets/crown.png')),
        SizedBox(
          width: 5.w,
        ),
        Text(
          benefit,
          style: TextStyle(
              color: Colors.blue.shade500,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
