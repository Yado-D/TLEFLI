import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/common/route_handler/pages.dart';


void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...NamedRouteSettings.allBlocProviders(context)],
      child: ScreenUtilInit(
        child: MaterialApp(
          onGenerateRoute: NamedRouteSettings.GenerateRouteSettings,
          debugShowCheckedModeBanner: false,
          title: 'TLEFLI APP',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
