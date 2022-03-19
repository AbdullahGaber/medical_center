import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/components/ticket_widget.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class TopDoctorCard extends StatelessWidget {
  const TopDoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    'assets/images/doctor3.jpg',
                    fit: BoxFit.cover,
                    height: ScreenUtil().setHeight(110),
                    width: ScreenUtil().setWidth(120),
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil().setHeight(5),
                  right: ScreenUtil().setWidth(5),
                  child: const TicketWidget(
                    backgroundColor: MainStyle.darkStarColor,
                    widgetColor: Colors.white,
                    title: '4.9',
                    icon: Icons.star,
                  ),
                ),
              ],
            ),
            const BoxHelper(
              height: 10,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
