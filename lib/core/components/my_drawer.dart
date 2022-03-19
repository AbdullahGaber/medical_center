import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_center/APP/auth/viewModel/signOut/sign_out_cubit.dart';
import 'package:medical_center/APP/splash/splash_screen.dart';
import 'package:medical_center/core/components/custom_new_dialog.dart';
import 'package:medical_center/core/helper/navigator.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.context,
  }) : super(key: key);
  final BuildContext? context;

  @override
  Widget build(BuildContext ctx) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: MainStyle.darkColor,
              height: 150,
              width: double.infinity,
              // padding: const EdgeInsets.symmetric(vertical: 5),
              child: SafeArea(
                child: Image.asset(
                  'assets/icons/icon1.webp',
                  fit: BoxFit.fill,
                  // height: ScreenUtil().setHeight(90),
                ),
              ),
            ),

            // const Spacer(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: DrawerItem(
                title: 'logout',
                icons: Icons.logout,
                onPressed: () async {
                  N.back();
                  CustomDialog().showOptionDialog(
                    context: context!,
                    msg: 'Do You Want Log out?',
                    okMsg: 'yes',
                    cancelFun: () {},
                    cancelMsg: 'no',
                    okFun: () => context!.read<SignOutCubit>().signOut(context),
                  );
                },
                isReversed: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
