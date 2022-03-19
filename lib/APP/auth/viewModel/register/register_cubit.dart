import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_center/APP/auth/model/user_model.dart';
import 'package:medical_center/APP/home/view/doctor_home_screen.dart';
import 'package:medical_center/APP/home/view/user_home_screen.dart';
import 'package:medical_center/core/components/custom_new_dialog.dart';
import 'package:medical_center/core/helper/navigator.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    var validate = formKey.currentState!.validate();
    if (!validate || pickedImage == null) {
      if (pickedImage == null) {
        Fluttertoast.showToast(
            msg: 'You Should add Profile Image', backgroundColor: Colors.red);
      }
      return;
    }
    emit(RegisterLoading());

    try {
      var register = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var imageUrl = await getImageUrl(userId: register.user?.uid);

      var user = register.user!;
      user.updateDisplayName(nameController.text);
      user.updatePhotoURL(imageUrl);
      FirebaseFirestore.instance
          .collection('users')
          .doc(register.user?.uid)
          .set(
        {
          'user_type': userType,
          'user_name': nameController.text,
          'profile': imageUrl,
          if (userType == 'doctor') ...{
            'speciality': specialityController.text,
          }
        },
      );
      await GetStorage().write(
          'user',
          jsonEncode(UserModel(
            userType: userType,
            speciality: specialityController.text,
            profile: imageUrl,
            userName: nameController.text,
          ).toJson()));
      N.replaceAll(
        userType == 'user' ? const UserHomeScreen() : const DoctorHomeScreen(),
      );
    } on FirebaseAuthException catch (error) {
      String errorMessage = '';
      if (error.code == 'invalid-email') {
        errorMessage = 'email address is not valid.';
      } else if (error.code == 'email-already-in-use') {
        errorMessage =
            'there already exists an account with the given email address.';
      } else if (error.code == 'operation-not-allowed') {
        errorMessage = 'Something went wrong, please contact the admin';
      } else if (error.code == 'weak-password') {
        errorMessage = 'the password is not strong enough.';
      }
      emit(RegisterError());
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
      emit(RegisterNetworkError());
    }
  }

  Future<String?> getImageUrl({String? userId}) async {
    try {
      var ref = FirebaseStorage.instance
          .ref()
          .child('/userProfileImage')
          .child(userId ?? '')
          .child('/${userId ?? ''}.jpg');
      final metaData =
          SettableMetadata(contentType: 'image/jpeg', customMetadata: {
        'picked-file-path': pickedImage!.path,
      });
      var uploadTask = await ref.putFile(pickedImage!, metaData);
      return uploadTask.ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  void changeUserType(String? newUserType) {
    _userType = newUserType ?? '';
    emit(UserTypeChanged());
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? pickedImage;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var specialityController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  String _userType = 'user';
  String get userType => _userType;

  String? nameValidate(String? value) {
    if (value!.isEmpty) {
      return 'Name is Required';
    }
    if (value.length < 3) {
      return 'invalid Name';
    }
    return null;
  }

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

  String? passwordConfirmationValidate(String? value) {
    if (value!.isEmpty) {
      return 'You Should Confirm Your Password';
    }
    if (passwordController.text.isNotEmpty &&
        passwordController.text != value) {
      return 'Password does not match';
    }
    return null;
  }

  String? specialityValidate(String? value) {
    if (value!.isEmpty) {
      return 'You Should Add Your Speciality';
    }

    return null;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    specialityController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
