import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:tlefli_new_app_design/common/route_handler/pages.dart';
import 'package:tlefli_new_app_design/controllers/language_controller.dart';
import 'package:tlefli_new_app_design/l10n/l10n.dart';
import 'package:tlefli_new_app_design/services/providers/local_provider.dart';
import 'package:tlefli_new_app_design/utils/app_constant.dart';
import 'package:tlefli_new_app_design/utils/dep.dart' as dep;
import 'package:tlefli_new_app_design/utils/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...NamedRouteSettings.allBlocProviders(context)],
      child: ScreenUtilInit(
        child: ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
          builder: (context, child) {
            final provider = Provider.of<LocaleProvider>(context);
            return RebuildApp(
              key: UniqueKey(), // Ensure a unique key is generated
              locale: provider.locale,
            );
          },
        ),
      ),
    );
  }
}

class RebuildApp extends StatefulWidget {
  final Locale locale;
  const RebuildApp({Key? key, required this.locale}) : super(key: key);

  @override
  _RebuildAppState createState() => _RebuildAppState();
}

class _RebuildAppState extends State<RebuildApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: NamedRouteSettings.GenerateRouteSettings,
      debugShowCheckedModeBanner: false,
      title: 'TLEFLI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: L10n.all,
      locale: widget.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
    );
  }
}
