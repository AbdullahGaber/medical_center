import 'package:flutter/material.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/themes/themes.dart';


class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
    required this.widgetColor,
    required this.backgroundColor,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final Color widgetColor;
  final Color backgroundColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Row(
        children: [
           Icon(
            icon,
            color: widgetColor,
          ),
          const BoxHelper(
            width: 3,
          ),
          Text(
            title,
            style: MainTheme.subTextStyleLite.copyWith(
              
              color: widgetColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
