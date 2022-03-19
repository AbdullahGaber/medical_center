import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/themes/main_style.dart';

// import 'screen_utility.dart';

class MainTheme {
  static final subTextStyleBold = TextStyle(
    color: MainStyle.darkGreyColor,
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(14),
  );
  static final subTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(14),
    color: MainStyle.darkGreyColor,
  );
  static final subTextStyleLite = TextStyle(
    fontSize: ScreenUtil().setSp(11),
    color: MainStyle.darkGreyColor,
  );
  static final buttonStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(17),
  );
  static final headerStyle1 = TextStyle(
    fontSize: ScreenUtil().setSp(30),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final headerStyle2 = TextStyle(
    color: MainStyle.mainColor,
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(20),
  );
  static final headerStyle3 = TextStyle(
    color: MainStyle.mainColor,
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(14),
  );
  static final headerStyle4 = TextStyle(
    color: MainStyle.darkGreyColor,
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(14),
  );
}
