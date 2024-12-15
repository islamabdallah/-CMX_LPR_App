import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpr/presentation/screens/splash/splash_screen.dart';
import 'core/route/route.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'logic/home/home_cubit.dart';
import 'logic/notification/notification_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: Locale('ar'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => sl<HomeCubit>(),
          ),
          BlocProvider<NotificationCubit>(
            create: (context) => sl<NotificationCubit>(),
          ),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      title: 'LPR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
