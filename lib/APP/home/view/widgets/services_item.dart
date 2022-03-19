import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/themes/themes.dart';


class ServicesItem extends StatelessWidget {
  const ServicesItem({
    Key? key,
    required this.title,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Color iconColor;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: [
              Card(
                color: iconColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: icon.runtimeType == String
                      ? Image.asset(
                          icon,
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(50),
                          // color: Colors.white,
                        )
                      : Icon(
                          icon,
                          color: Colors.white,
                        ),
                ),
              ),
              const BoxHelper(
                width: 6,
              ),
              Text(
                title,
                style: MainTheme.headerStyle4.copyWith(
                  color: Colors.black,
                  // fontSize: ScreenUtil().setSp(12),
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
