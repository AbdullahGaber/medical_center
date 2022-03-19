import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/components/custom_new_dialog.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/helper/helper.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Helper.currentUserData;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hi, ',
                          style: MainTheme.headerStyle4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: user.userName ?? '',
                          style: MainTheme.headerStyle4.copyWith(
                            color: MainStyle.mainColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // BoxHelper(width: 10,),

                  const BoxHelper(
                    height: 20,
                  ),
                ],
              ),
              const BoxHelper(
                height: 15,
              ),
              Text(
                'Let\'s Check \nYour Schedule today!',
                maxLines: 2,
                style: MainTheme.headerStyle2.copyWith(
                  color: Colors.black,
                ),
              )
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundImage: NetworkImage(
              user.profile ?? '',
            ),
            radius: ScreenUtil().radius(35),
          ),
        ],
      ),
    );
  }
}
