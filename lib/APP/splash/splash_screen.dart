import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_center/APP/auth/view/login_screen.dart';
import 'package:medical_center/APP/auth/viewModel/login/login_cubit.dart';
import 'package:medical_center/APP/home/view/doctor_home_screen.dart';
import 'package:medical_center/APP/home/view/user_home_screen.dart';
import 'package:medical_center/core/helper/helper.dart';
import 'package:medical_center/core/helper/navigator.dart';
import 'package:medical_center/core/themes/main_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        N.replaceAll(
          GetStorage().hasData('user')
              ? (Helper.currentUserData.userType == 'user'
                  ? const UserHomeScreen()
                  : const DoctorHomeScreen())
              : BlocProvider<LoginCubit>(
                  create: (_) => LoginCubit(),
                  child: const LoginScreen(),
                ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainStyle.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/icon1.webp',
              // width: ScreenUtil().setHeight(200),
            ),
            Text(
              'Medical Center',
              style: TextStyle(
                color: const Color(0xff568EE4),
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
