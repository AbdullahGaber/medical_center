import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:medical_center/APP/home/view/widgets/services_item.dart';
import 'package:medical_center/core/themes/themes.dart';


class ServiesViewWidget extends StatelessWidget {
  const ServiesViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'Services',
            textAlign: TextAlign.start,
            style: MainTheme.headerStyle4.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        Row(
          children: [
            ServicesItem(
              title: 'Online \nPharmacy',
              // icon: 'assets/icons/pils.png',
              icon: Icons.medical_services,
              iconColor: const Color(0xffFFD97B),
            ),
            ServicesItem(
              title: 'Coronavirus \nNewsletter',
              icon: Icons.coronavirus,
              iconColor: Colors.purple,
            ),
          ],
        ),
        Row(
          children: [
            ServicesItem(
              title: 'Quick Test \nRegister',
              // icon: 'assets/icons/pils.png',
              icon: Icons.folder,
              iconColor: const Color(0xffFC9A8A),
            ),
            ServicesItem(
              title: 'Health \nDeclaration',
              icon: Elusive.clipboard,
              iconColor: Color(0xff61C9F4),
            ),
          ],
        ),
      ],
    );
  }
}
