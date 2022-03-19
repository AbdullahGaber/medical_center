import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/themes/main_style.dart';

class CustomizedTabBar extends StatelessWidget {
  const CustomizedTabBar({
    Key? key,
    required TabController controller,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      indicator: const BoxDecoration(
        color: Color(0xffE1ECE6),
        // border: Border.all(
        //   color: Theme.of(context).primaryColor,
        //   width: 1,
        // ),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(vertical: 5),
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: const Color(0xffa3a3a3),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: MainStyle.mainColorDark,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(14),
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(14),
      ),
      controller: _controller,
      tabs: const [
        Text(
          'User',
        ),
        Text(
          'Doctor',
        ),
      ],
    );
  }
}
