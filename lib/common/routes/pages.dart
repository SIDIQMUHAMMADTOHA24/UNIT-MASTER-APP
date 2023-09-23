// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conversion_app/common/routes/name.dart';
import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/home/detail/long/bloc/long_bloc.dart';

import 'package:conversion_app/view/home/detail/long/long_view.dart';
import 'package:conversion_app/view/home/testing/bloc/testing_bloc.dart';
import 'package:conversion_app/view/home/testing/testing.dart';
import 'package:flutter/material.dart';
import 'package:conversion_app/view/home/home_view.dart';
import 'package:conversion_app/view/login/login_view.dart';
import 'package:conversion_app/view/register/register_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/login/bloc/login_bloc.dart';
import '../../view/register/bloc/register_bloc.dart';
import '../../view/select_mode/bloc/dot_indicator_bloc.dart';
import '../../view/select_mode/select_mode_view.dart';
import '../../view/splash_sceen/splash_screen_view.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(routes: AppName.INITIAL, pages: SplashScreenView()),
      PageEntity(
          routes: AppName.SELECT_MODE,
          pages: const SelectModeView(),
          bloc: BlocProvider(
            create: (_) => DotIndicatorBloc(),
          )),
      PageEntity(
          routes: AppName.REGISTER,
          pages: const RegisterView(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          routes: AppName.LOGIN,
          pages: const LoginView(),
          bloc: BlocProvider(
            create: (_) => LoginBloc(),
          )),
      PageEntity(routes: AppName.HOME, pages: const HomeView()),
      PageEntity(
          routes: AppName.LONG,
          pages: const LongView(),
          bloc: BlocProvider(
            create: (context) => LongBloc(),
          )),
      PageEntity(
          routes: AppName.TESTING,
          pages: const TestingView(),
          bloc: BlocProvider(
            create: (context) => TestingBloc(),
          ))
    ];
  }

  //BLOC PROVIDER
  static List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProvider.add(bloc.bloc);
      }
    }
    return blocProvider;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //! fungsi where berfungsi untuk mengfilter
      var resault =
          routes().where((element) => element.routes == settings.name);
      if (resault.isNotEmpty) {
        print('frist log');
        print(resault.first.routes);
        bool deviceFristOpen = Global.storageService.autoLogin();
        if (resault.first.routes == AppName.INITIAL) {
          print('lewat sini tuan');
          if (deviceFristOpen) {
            print('revisi ke 17');
            return MaterialPageRoute(
                builder: (context) => const HomeView(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (context) => SplashScreenView(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (context) => resault.first.pages, settings: settings);
      }
    }
    print('invalid routes ${settings.name}');
    return MaterialPageRoute(
        builder: (context) => const SelectModeView(), settings: settings);
  }
}

class PageEntity {
  String routes;
  Widget pages;
  dynamic bloc;
  PageEntity({
    required this.routes,
    required this.pages,
    this.bloc,
  });
}
