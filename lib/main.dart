import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:university/presentation/screens/splash_screen/splash_screen.dart';
import 'package:university/presentation/styles/app_colors.dart';
import 'business_logic/auth/login/login_cubit.dart';
import 'business_logic/auth/register/register_cubit.dart';
import 'business_logic/notes/notes_cubit.dart';
import 'data/data_provider/local/cache_helper.dart';
import 'data/data_provider/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'University App',
            theme: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.primaryColor,
              ),
            ))),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
