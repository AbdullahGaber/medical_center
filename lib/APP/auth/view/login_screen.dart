import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/APP/auth/view/register_screen.dart';
import 'package:medical_center/APP/auth/viewModel/login/login_cubit.dart';
import 'package:medical_center/APP/auth/viewModel/register/register_cubit.dart';
import 'package:medical_center/core/components/register_button.dart';
import 'package:medical_center/core/components/register_field.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/helper/navigator.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var login = context.read<LoginCubit>();
    return Scaffold(
      backgroundColor: MainStyle.mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/icons/icon1.webp',
                  width: ScreenUtil().setHeight(200),
                  height: ScreenUtil().setHeight(200),
                  alignment: Alignment.center,
                ),
                Text(
                  'Medical Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff568EE4),
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                )
              ],
            ),
            const BoxHelper(
              height: 40,
            ),
            Form(
              key: login.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegisterField(
                    labelText: 'Email',
                    controller: login.emailController,
                    validator: login.emailValidate,
                  ),
                  RegisterField(
                    labelText: 'Password',
                    obsecureText: true,
                    controller: login.passwordController,
                    validator: login.passwordValidate,
                  ),
                ],
              ),
            ),
            const BoxHelper(
              height: 60,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return RegisterButton(
                  title: 'Login',
                  radius: 10,
                  onPressed: state is LoginLoading
                      ? () {}
                      : () => login.login(context),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account ',
                      style: MainTheme.subTextStyle,
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          N.to(
                            BlocProvider<RegisterCubit>(
                              create: (_) => RegisterCubit(),
                              child: const RegisterScreen(),
                            ),
                          );
                        },
                      text: 'Signup',
                      style: MainTheme.subTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MainStyle.mainColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
