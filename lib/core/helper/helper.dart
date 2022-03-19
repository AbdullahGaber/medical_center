import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:medical_center/APP/auth/model/user_model.dart';

class Helper {
  static UserModel get currentUserData => UserModel.fromJson(jsonDecode(
        GetStorage().read('user') ?? '',
      ));
}
