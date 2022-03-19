import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_center/APP/auth/model/user_model.dart';
import 'package:medical_center/APP/home/view/doctor_home_screen.dart';
import 'package:medical_center/APP/home/view/user_home_screen.dart';
import 'package:medical_center/core/components/custom_new_dialog.dart';
import 'package:medical_center/core/helper/navigator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    var validate = formKey.currentState!.validate();

    if (!validate) {
      return;
    }
    emit(LoginLoading());

    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var extraUserData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user?.uid)
          .get();
      String userType = extraUserData.data()!['user_type'];
      await GetStorage().write(
        'user',
        jsonEncode(
          UserModel.fromJson(extraUserData.data() ?? {}).toJson(),
        ),
      );
      N.replaceAll(
        userType == 'user' ? const UserHomeScreen() : const DoctorHomeScreen(),
      );
    } on FirebaseAuthException catch (error) {
      String errorMessage = '';

      if (error.code == 'invalid-email') {
        errorMessage = 'email address is not valid.';
      } else if (error.code == 'user-disabled') {
        errorMessage =
            'the user corresponding to the given email has been disabled.';
      } else if (error.code == 'user-not-found') {
        errorMessage = 'there is no user corresponding to the given email.';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'the password is invalid for the given email.';
      }
      emit(LoginError());
      CustomDialog().showWarningDialog(
        context: context,
        msg: errorMessage,
        btnOnPress: () {},
      );
    } catch (error) {
      CustomDialog().showWarningDialog(
        context: context,
        msg: 'Check Your Network Connection',
        btnOnPress: () {},
      );
    }
  }

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? emailValidate(String? value) {
    if (value!.isEmpty) {
      return 'Email Address is Required';
    }
    if (!value.contains('@') ||
        !value.contains('.') ||
        value.split('.')[1].isEmpty) {
      return 'invalid email address';
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value!.isEmpty) {
      return 'password is Required';
    }
    if (value.length < 6) {
      return 'password is too short';
    }
    return null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
