import 'package:flutter/material.dart';
import 'package:medical_center/core/themes/themes.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icons,
    required this.onPressed,
    required this.title,
    this.isReversed = false,
  }) : super(key: key);
  final IconData icons;
  final String title;
  final void Function() onPressed;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isReversed)
          const Divider(
            thickness: 1,
          ),
        ListTile(
          onTap: onPressed,
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          minLeadingWidth: 4,
          leading: Icon(
            icons,
          ),
          title: Text(
            title,
            style: MainTheme.subTextStyleBold,
          ),
        ),
        if (!isReversed)
          const Divider(
            thickness: 1,
          ),
      ],
    );
  }
}
