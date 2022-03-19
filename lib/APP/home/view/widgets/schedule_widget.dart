import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 8,
      color: MainStyle.mainColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today, 18 March',
              style: MainTheme.subTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
            const BoxHelper(
              height: 5,
            ),
            Text(
              '08:00 AM - 09:30 AM',
              style: MainTheme.subTextStyleBold.copyWith(
                color: Colors.white,
              ),
            ),
            const BoxHelper(
              height: 20,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/doctor3.jpg',
                    height: ScreenUtil().setHeight(50),
                    fit: BoxFit.cover,
                    width: ScreenUtil().setWidth(60),
                  ),
                ),
                const BoxHelper(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ahmed Mohamed',
                      style: MainTheme.subTextStyleBold
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'Therapist',
                      style: MainTheme.subTextStyleLite
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
