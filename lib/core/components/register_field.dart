import 'package:flutter/material.dart';
import 'package:medical_center/core/themes/main_style.dart';

// import 'package:store/core/extensions/string.dart';
// import 'package:store/core/themes/screen_utility.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key? key,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obsecureText = false,
    this.thinBorder = false,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.maxLines = 1,
    this.onChanged,
  }) : super(key: key);
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final bool thinBorder;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final void Function(String?)? onChanged;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        maxLines: maxLines,
        onChanged: onChanged,
        autovalidateMode: autovalidateMode,
        controller: controller,
        validator: validator,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainStyle.mainColorLight,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MainStyle.mainColorLight,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
            borderSide: BorderSide(
              width: thinBorder ? 1 : 2,
              color: MainStyle.mainColorLight,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
            borderSide: BorderSide(
              width: thinBorder ? 1 : 2,
              color: MainStyle.mainColorLight,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(thinBorder ? 12 : 25),
            borderSide: BorderSide(
              width: thinBorder ? 1 : 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
