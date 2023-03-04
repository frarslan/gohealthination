import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/auth/auth_bloc.dart';
import 'package:gohealthination/pages/auth/splash_screen.dart';
import 'package:gohealthination/pages/auth/welcome.dart';
import 'package:gohealthination/pages/pages_manager.dart';
import 'package:gohealthination/pages/pages_route_cubit.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
 // initializeDateFormatting('tr_TR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: ((context) => AuthCubit()..getToken)),
            BlocProvider(create: ((context) => PagesRoute())),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'healthination',
              home: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  print(state);
                  switch (state) {
                    case AuthState.offline:
                      return const WelcomePage();
                    case AuthState.online:
                      return const PagesManager();
                    default:
                      return const SplashScreen();
                  }
                },
              )),
        );
      },
    );
  }
}