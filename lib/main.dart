import 'package:conversion_app/common/routes/pages.dart';
import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/home/detail/long/long_view.dart';
import 'package:conversion_app/view/home/testing/testing.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        //SPREED OPRATOR INI BERGUNA UNTUK MENAMBAHKAN OBJECK / LIST
        providers: [...AppPages.allBlocProvider(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            debugShowCheckedModeBanner: false,
            // onGenerateRoute: AppPages.GenerateRouteSettings,
            home: LongView(),
          ),
        ));
  }
}
