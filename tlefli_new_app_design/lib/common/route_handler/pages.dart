import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlefli_new_app_design/common/route_handler/name.dart';
import 'package:tlefli_new_app_design/pages/Help/page/help_page.dart';
import 'package:tlefli_new_app_design/pages/about%20us/page/about_us_page.dart';
import 'package:tlefli_new_app_design/pages/contact_us/page/contact_us_page.dart';
import 'package:tlefli_new_app_design/pages/faq/page/faq_page.dart';
import 'package:tlefli_new_app_design/pages/home/bloc/home_bloc.dart';
import 'package:tlefli_new_app_design/pages/home/page/home.dart';
import 'package:tlefli_new_app_design/pages/i%20lost/bloc/i_lost_bloc.dart';
import 'package:tlefli_new_app_design/pages/i%20lost/page/i_lost_page.dart';
import 'package:tlefli_new_app_design/pages/language/page/language_page.dart';
import 'package:tlefli_new_app_design/pages/request/page/request_page.dart';
import 'package:tlefli_new_app_design/pages/setting/page/settings.dart';
import 'package:tlefli_new_app_design/pages/signin/bloc/signin_bloc.dart';
import 'package:tlefli_new_app_design/pages/signin/pages/sign_in_page.dart';
import 'package:tlefli_new_app_design/pages/signup/bloc/signup_bloc.dart';
import 'package:tlefli_new_app_design/pages/signup/page/sign_up_page.dart';
import 'package:tlefli_new_app_design/pages/welcome/pages/welcome_page.dart';

class NamedRouteSettings {
  NamedRouteSettings({required BuildContext context});

  static List<pageEntity> allPages() {
    return [
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE,
        page: const WelcomePage(),
      ),
      pageEntity(
        route: NamedRoutes.SIGNIN_PAGE,
        page: const sign_in_page(),
        bloc: BlocProvider(
          create: (_) => SigninBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.SIGNUP_PAGE,
        page: const sign_up_page(),
        bloc: BlocProvider(
          create: (_) => SignupBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.HOME_PAGE,
        page: const home_page(),
        bloc: BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.I_LOST_PAGE,
        page: const i_lost_page(),
        bloc: BlocProvider(
          create: (_) => ILostBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.REQUEST_PAGE,
        page: const request_page(),
      ),
      pageEntity(
        route: NamedRoutes.SETTINGS_PAGE,
        page: const settings_page(),
      ),
      pageEntity(
        route: NamedRoutes.LANGUAGE_PAGE,
        page: const language_page(),
      ),
      pageEntity(
        route: NamedRoutes.ABOUT_US_PAGE,
        page: const about_us_page(),
      ),
      pageEntity(
        route: NamedRoutes.FAQ_PAGE,
        page: faq_page(),
      ),
      pageEntity(
        route: NamedRoutes.TUTORIAL_PAGE,
        page: TutorialsSection(),
      ),
      pageEntity(
        route: NamedRoutes.HELP_PAGE,
        page: HelpSection(),
      ),
      pageEntity(
        route: NamedRoutes.CONTACT_US_PAGE,
        page: ContactSupportSection(),
      ),
      //   pageEntity(
      //   route: NamedRoutes.CONTACT_US_PAGE,
      //   page: ContactSupportSection(),
      // ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in allPages()) {
      if (bloc.bloc != null) blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var route = allPages().where((element) => element.route == settings.name);
      if (route.isNotEmpty) {
        print('valid routes');
        return MaterialPageRoute(
            builder: (_) => route.first.page, settings: settings);
        //check if the user is already logged in to dont exaust user
        // by asking loggin again and again
        //   bool firstStartApp = Global.storageServices.GetDeviceFirstOpen();
        //   if (route.first.route == NamedRoutes.WELCOCME_PAGE1 && firstStartApp) {
        //     print('the user already pass the welcome page 4');
        //     return MaterialPageRoute(
        //         builder: (_) => const SignInPage(), settings: settings);
        //   }
        //   if (route.first.route == NamedRoutes.HOME_PAGE &&
        //       settings.arguments != null) {
        //     final arg = settings.arguments;
        //     if (arg is Map<String, dynamic>?) {
        //       print('user is  on free type');
        //       return MaterialPageRoute(
        //           builder: (_) => home_page(alpha: arg), settings: settings);
        //     }
        //   }
        //   if (route.first.route == NamedRoutes.ACCOUNT_PAGE &&
        //       settings.arguments != null) {
        //     final arg = settings.arguments;
        //     if (arg is Map<String, dynamic>?) {
        //       print('user is  on free type');
        //       return MaterialPageRoute(
        //           builder: (_) => account_page(alpha: arg), settings: settings);
        //     }
        //   } else {
        //     return MaterialPageRoute(
        //         builder: (_) => route.first.page, settings: settings);
        //   }
      }
      print('invalid routes');
    }
    return MaterialPageRoute(
        builder: (_) => const WelcomePage(), settings: settings);
  }
}

class pageEntity {
  String route;
  Widget page;
  dynamic bloc;
  pageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
