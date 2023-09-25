import 'package:conversion_app/common/routes/pages.dart';
import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/home/detail/long/long_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  Bloc.observer = MyBlocObserver();
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
            home: const LongView(),
          ),
        ));
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // TODO: implement onEvent
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(bloc);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // TODO: implement onChange
  }
}
