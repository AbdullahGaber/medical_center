import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                'assets/images/doctor1.jpg',
                fit: BoxFit.cover,
                height: ScreenUtil().setHeight(110),
                width: ScreenUtil().setWidth(80),
              ),
            ),
            const BoxHelper(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Mohamed Ahmed',
                  style: MainTheme.headerStyle4.copyWith(
                    color: Colors.black,
                  ),
                ),
                const BoxHelper(
                  height: 5,
                ),
                Text(
                  'Therapist',
                  style: MainTheme.subTextStyleLite.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const BoxHelper(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MainStyle.lightGreenColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: ScreenUtil().radius(15),
                        color: MainStyle.darkGreenColor,
                      ),
                      const BoxHelper(
                        width: 10,
                      ),
                      Text(
                        '12:54 AM - 12:56 PM',
                        style: MainTheme.subTextStyleLite.copyWith(
                          color: MainStyle.darkGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const BoxHelper(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MainStyle.lightStarColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: MainStyle.darkStarColor,
                      ),
                      const BoxHelper(
                        width: 3,
                      ),
                      Text(
                        '4.9',
                        style: MainTheme.subTextStyleLite.copyWith(
                          color: MainStyle.darkStarColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
