import 'package:flutter/material.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';


class UserTypeWidget extends StatelessWidget {
  const UserTypeWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);
  final String title;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Radio<String>(
            groupValue: groupValue,
            onChanged: onChanged,
            value: value,
            
          ),
          Text(
            title,
            style: MainTheme.headerStyle4.copyWith(
              color: MainStyle.mainColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
