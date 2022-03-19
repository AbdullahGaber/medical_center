import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:medical_center/APP/home/view/widgets/schedule_widget.dart';
import 'package:medical_center/APP/home/view/widgets/page_header_widget.dart';
import 'package:medical_center/APP/home/view/widgets/services_view_widget.dart';
import 'package:medical_center/APP/home/view/widgets/top_doctor_card.dart';
import 'package:medical_center/core/components/custom_new_dialog.dart';
import 'package:medical_center/core/components/my_drawer.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/components/ticket_widget.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(context: context),
      backgroundColor: MainStyle.lightGreyColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: MainStyle.mainColorDark,
        // elevation: 0,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     PopupMenuButton(
      //         onSelected: (v) {
      //           if (v == 'signout') {
      //             CustomDialog().showOptionDialog(
      //               context: context,
      //               msg: 'Do you want to Sign Out?',
      //               okMsg: 'yes',
      //               okFun: () {},
      //               cancelMsg: 'no',
      //               cancelFun: () {},
      //             );
      //           }
      //         },
      //         child: Icon(
      //           Icons.settings,
      //           color: MainStyle.mainColorDark,
      //         ),
      //         itemBuilder: (_) => [
      //               PopupMenuItem(
      //                 value: 'signout',
      //                 child: Text(
      //                   'Sign Out',
      //                 ),
      //               ),
      //             ])
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PageHeaderWidget(),
              const BoxHelper(
                height: 20,
              ),
              const ScheduleWidget(),
              const BoxHelper(
                height: 10,
              ),
              const ServiesViewWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(250),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const BoxHelper(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Top Doctors',
                        textAlign: TextAlign.start,
                        style: MainTheme.headerStyle4.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          10,
                          (index) => const TopDoctorCard(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
