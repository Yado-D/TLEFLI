import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlefli_new_app_design/admin_pages/add_partners/pages/add_partner_page.dart';
import 'package:tlefli_new_app_design/admin_pages/home/pages/admin_home.dart';
import 'package:tlefli_new_app_design/admin_pages/remove_partners/pages/remove_partners_page.dart';
import 'package:tlefli_new_app_design/common/route_handler/name.dart';
import 'package:tlefli_new_app_design/partners_pages/agreement/page/agreement_page.dart';
import 'package:tlefli_new_app_design/partners_pages/home/pages/Partner_request_details.dart';
import 'package:tlefli_new_app_design/partners_pages/home/pages/partners_home.dart';
import 'package:tlefli_new_app_design/partners_pages/rejected/page/rejected_items.dart';
import 'package:tlefli_new_app_design/partners_pages/verified_item/pages/verified_item.dart';
import 'package:tlefli_new_app_design/user_pages/Help/page/help_page.dart';
import 'package:tlefli_new_app_design/user_pages/about%20us/page/about_us_page.dart';
import 'package:tlefli_new_app_design/user_pages/contact_us/page/contact_us_page.dart';
import 'package:tlefli_new_app_design/user_pages/faq/page/faq_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/bloc/home_bloc.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/home.dart';
import 'package:tlefli_new_app_design/user_pages/i%20lost/bloc/i_lost_bloc.dart';
import 'package:tlefli_new_app_design/user_pages/i%20lost/page/i_lost_page.dart';
import 'package:tlefli_new_app_design/user_pages/language/page/language_page.dart';
import 'package:tlefli_new_app_design/user_pages/request/page/request_page.dart';
import 'package:tlefli_new_app_design/user_pages/setting/page/settings.dart';
import 'package:tlefli_new_app_design/user_pages/signin/bloc/signin_bloc.dart';
import 'package:tlefli_new_app_design/user_pages/signin/pages/forgot_password.dart';
import 'package:tlefli_new_app_design/user_pages/signin/pages/sign_in_page.dart';
import 'package:tlefli_new_app_design/user_pages/signup/bloc/signup_bloc.dart';
import 'package:tlefli_new_app_design/user_pages/signup/page/sign_up_page.dart';
import 'package:tlefli_new_app_design/user_pages/welcome/pages/welcome_page.dart';

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
        page: language_page(),
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
      pageEntity(
        route: NamedRoutes.PARTNER_PAGE,
        page: partners_home(),
      ),
      pageEntity(
        route: NamedRoutes.PARTNER_REQUEST_DETAILS_PAGE,
        page: Partner_request_details(),
      ),
      pageEntity(
        route: NamedRoutes.VERIFIED_PAGE,
        page: verified_items(),
      ),
      pageEntity(
        route: NamedRoutes.REJECTED_PAGE,
        page: rejected_items_page(),
      ),
      pageEntity(
        route: NamedRoutes.AGREEMENT_PAGE,
        page: Agreement_page(),
      ),
      pageEntity(
        route: NamedRoutes.ADD_PARTNERS_PAGE,
        page: add_partners_page(),
      ),
      pageEntity(
        route: NamedRoutes.REMOVE_PARTNERS_PAGE,
        page: remove_partners_page(),
      ),
      pageEntity(
        route: NamedRoutes.ADMIN_HOME_PAGE,
        page: admin_home_page(),
      ),
      pageEntity(
        route: NamedRoutes.FORGOT_PASSWORD_PAGE,
        page: forgot_password_page(),
      ),
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
