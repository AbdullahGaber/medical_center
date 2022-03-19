import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical_center/APP/splash/splash_screen.dart';
import 'package:medical_center/core/helper/navigator.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  Future<void> signOut(context) async {
    emit(SignOutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      await GetStorage().remove('user');
      Phoenix.rebirth(context);
      N.replaceAll(const SplashScreen());

      emit(SignOutDone());
    } catch (e) {
      log('message $e');
      emit(SignOutNetworkError());
    }
  }
}
