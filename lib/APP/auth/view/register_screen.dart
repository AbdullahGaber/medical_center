import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_center/APP/auth/view/widgets/profile_picture_widget.dart';
import 'package:medical_center/APP/auth/view/widgets/register_view_widget.dart';
import 'package:medical_center/APP/auth/viewModel/register/register_cubit.dart';
import 'package:medical_center/core/components/cusomized_tab_bar.dart';
import 'package:medical_center/core/components/register_button.dart';
import 'package:medical_center/core/components/register_field.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/helper/navigator.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late RegisterCubit registerCubit;
  @override
  void initState() {
    registerCubit = context.read<RegisterCubit>();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(_onChanged);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    registerCubit.changeUserType(
      _controller.index == 0 ? 'user' : 'doctor',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainStyle.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RegisterView(
                registerCubit: registerCubit,
              ),
            ),
            // CustomizedTabBar(controller: _controller),
            // Expanded(
            //     child: TabBarView(
            //   controller: _controller,
            //   children: List.generate(
            //     _controller.length,
            //     (index) => RegisterView(
            //       registerCubit: registerCubit,
            //     ),
            //   ),
            // ))
          ],
        ),
      ),
    );
  }
}
