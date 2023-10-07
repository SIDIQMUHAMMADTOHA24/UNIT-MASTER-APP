// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conversion_app/common/routes/name.dart';
import 'package:conversion_app/global.dart';
import 'package:conversion_app/view/login/login_view.dart';
import 'package:conversion_app/view/register/register_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/login/bloc/login_bloc.dart';

import '../../view/mode/premium/home/detail/long/bloc/long_bloc.dart';

import '../../view/mode/premium/home/detail/long/long_view.dart';
import '../../view/mode/premium/home/detail/massa/bloc/massa_bloc.dart';
import '../../view/mode/premium/home/detail/massa/massa_view.dart';
import '../../view/mode/premium/home/detail/suhu/bloc/suhu_bloc.dart';
import '../../view/mode/premium/home/detail/suhu/suhu_view.dart';
import '../../view/mode/premium/home/detail/time/bloc/time_bloc.dart';
import '../../view/mode/premium/home/detail/time/time_view.dart';
import '../../view/mode/premium/home/home_view.dart';
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
      PageEntity(routes: AppName.HOME, pages: HomeView()),
      PageEntity(
          routes: AppName.LONG,
          pages: const LongView(),
          bloc: BlocProvider(
            create: (_) => LongBloc(),
          )),
      PageEntity(
          routes: AppName.MASSA,
          pages: const MassaView(),
          bloc: BlocProvider(
            create: (_) => MassaBloc(),
          )),
      PageEntity(
          routes: AppName.SUHU,
          pages: const SuhuView(),
          bloc: BlocProvider(
            create: (_) => SuhuBloc(),
          )),
      PageEntity(
          routes: AppName.TIME,
          pages: const TimeView(),
          bloc: BlocProvider(
            create: (_) => TimeBloc(),
          )),
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
        bool getBool = Global.storageService.getBool();
        //jika pages / view initial dan getBoll == true maka dia akan langsung mengarah ke selctModeview
        //digunakan ketika sesudah log out
        if (resault.first.routes == AppName.INITIAL && getBool) {
          //digunakan ketika sudah login
          bool getString = Global.storageService.getString();
          if (getString) {
            return MaterialPageRoute(
                builder: (context) => HomeView(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (context) => const SelectModeView(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (context) => resault.first.pages, settings: settings);
      }
    }
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
