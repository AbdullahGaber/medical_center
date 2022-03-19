import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDialog {
  Future<dynamic> showWarningDialog(
      {required BuildContext? context,
      required String msg,
      String? btnMsg,
      required Function btnOnPress,
      bool showHeader = false,
      bool dismiss = true,
      num? width}) {
    return AwesomeDialog(
      width: kIsWeb ? ScreenUtil().setWidth(75) : null,
      dismissOnTouchOutside: dismiss,

      dismissOnBackKeyPress: dismiss,
      headerAnimationLoop: showHeader,
      btnOkColor: Theme.of(context!).primaryColor,
      context: context,
      animType: AnimType.SCALE,
      customHeader: !showHeader
          ? null
          : SizedBox(
              child: ImageIcon(
                const AssetImage('assets/icons/warning.png'),
                color: Theme.of(context).primaryColor,
                size: ScreenUtil().radius(70),
              ),
            ),
      dialogType: showHeader ? DialogType.WARNING : DialogType.NO_HEADER,
      body: Center(
        child: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ),
      btnOkOnPress: btnOnPress,
      // btnOkText: 'Ok',
      btnOkText: 'ok',
    ).show();
  }

  Future<dynamic> showErrorDialog(
      {required String msg,
      required String ok,
      required BuildContext context,
      required Function btnOnPress,
      required int code}) {
    return AwesomeDialog(
            headerAnimationLoop: false,
            btnOkColor: Theme.of(context).primaryColor,
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  msg,
                  style:const TextStyle(),
                ),
              ),
            ),
            btnOkOnPress: btnOnPress,
            btnOkText: ok)
        .show();
  }

  Future<dynamic> showSuccessDialog({
    required BuildContext context,
    required String msg,
    required String btnMsg,
    required Function btnOnPress,
  }) {
    return AwesomeDialog(
            headerAnimationLoop: false,
            btnOkColor: Theme.of(context).primaryColor,
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  msg,
                  style:const TextStyle(),
                ),
              ),
            ),
            btnOkOnPress: btnOnPress,
            btnOkText: btnMsg,
            aligment: Alignment.center)
        .show();
  }

  Future<dynamic> showOptionDialog({
    required BuildContext context,
    required String msg,
    required String okMsg,
    String? oknoLocalizationTxt,
    required Function okFun,
    required String cancelMsg,
    String? cancelnoLocalizationTxt,
    required Function cancelFun,
    num? width,
  }) {
    return AwesomeDialog(
      headerAnimationLoop: false,
      context: context,
      width: kIsWeb ? ScreenUtil().setWidth(75) : null,
      btnOkColor: Theme.of(context).primaryColor,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: Center(
        child: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ),
      btnOkOnPress: okFun,
      btnOkText: okMsg,
      // btnOkText: okMsg,
      btnCancelOnPress: cancelFun,
      btnCancelText: cancelMsg,
      // btnCancelText: cancelMsg,
    ).show();
  }

  Future<dynamic> showWidgetDialog({
    required BuildContext context,
    required String okMsg,
    required Function okFun,
    required Widget body,
  }) {
    return AwesomeDialog(
      headerAnimationLoop: false,
      context: context,
      btnOkColor: Theme.of(context).primaryColor,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: body,
      btnOkOnPress: okFun,
      btnOkText: okMsg,
    ).show();
  }
}
