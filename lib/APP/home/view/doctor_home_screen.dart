import 'package:flutter/material.dart';
import 'package:medical_center/core/components/doctor_card.dart';
import 'package:medical_center/core/components/my_drawer.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainStyle.lightGreyColor,
      drawer: MyDrawer(context: context),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          'Center Name',
          style: MainTheme.subTextStyleBold.copyWith(
              // color: MainStyle.mainColorDark,
              color: Colors.white),
        ),
        backgroundColor: MainStyle.mainColorDark,
        // elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'Doctors',
              textAlign: TextAlign.start,
              style: MainTheme.headerStyle4.copyWith(
                color: MainStyle.mainColorLight,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    10,
                    (index) => const DoctorCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
