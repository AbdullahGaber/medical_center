// import 'dart:html' as html;
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

// import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_center/core/components/image_picker_dialog.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({
    Key? key,
    required this.onPicked,
  }) : super(key: key);
  final void Function(File?) onPicked;

  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  // Uint8List bytesImage;
  // String fileName;
  // Uint8List fileBytes;
  String? url;
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Card(
            shape: CircleBorder(),
            elevation: 5,
            child: CircleAvatar(
              radius: ScreenUtil().radius(50),
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: ScreenUtil().radius(49),
                backgroundImage: pickedImage == null
                    ? (const AssetImage(
                        'assets/images/profile2.png',
                      ))
                    : FileImage(
                        pickedImage!,
                      ) as ImageProvider,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                ImagePickerDialog().show(
                    context: context,
                    onGet: (f) {
                      if (f != null) {
                        widget.onPicked(f);
                        setState(() {
                          pickedImage = f;
                        });
                      }
                      // changeData.image = f;
                    });
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 13,
                  child: const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
