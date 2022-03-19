import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_center/APP/auth/view/widgets/profile_picture_widget.dart';
import 'package:medical_center/APP/auth/viewModel/register/register_cubit.dart';
import 'package:medical_center/core/components/register_button.dart';
import 'package:medical_center/core/components/register_field.dart';
import 'package:medical_center/core/components/sized_box_helper.dart';
import 'package:medical_center/core/components/user_type_widget.dart';
import 'package:medical_center/core/helper/navigator.dart';
import 'package:medical_center/core/themes/main_style.dart';
import 'package:medical_center/core/themes/themes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    Key? key,
    required this.registerCubit,
  }) : super(key: key);

  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const BoxHelper(
                height: 50,
              ),
              Form(
                key: registerCubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfilePictureWidget(
                      onPicked: (f) {
                        if (f == null) {
                          return;
                        }
                        registerCubit.pickedImage = f;
                      },
                    ),
                    const BoxHelper(
                      height: 20,
                    ),
                    RegisterField(
                      labelText: 'Name',
                      controller: registerCubit.nameController,
                      validator: registerCubit.nameValidate,
                    ),
                    Visibility(
                      visible: registerCubit.userType == 'doctor',
                      child: RegisterField(
                        key: ValueKey(registerCubit.userType),
                        labelText: 'Speciality',
                        controller: registerCubit.specialityController,
                        validator: registerCubit.specialityValidate,
                      ),
                    ),
                    RegisterField(
                      labelText: 'Email',
                      controller: registerCubit.emailController,
                      validator: registerCubit.emailValidate,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    RegisterField(
                      labelText: 'Password',
                      controller: registerCubit.passwordController,
                      validator: registerCubit.passwordValidate,
                      obsecureText: true,
                    ),
                    RegisterField(
                      labelText: 'Password Confirmation',
                      controller: registerCubit.passwordConfirmationController,
                      validator: registerCubit.passwordConfirmationValidate,
                      obsecureText: true,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserTypeWidget(
                          groupValue: registerCubit.userType,
                          onChanged: registerCubit.changeUserType,
                          value: 'user',
                          title: 'User',
                        ),
                        UserTypeWidget(
                          groupValue: registerCubit.userType,
                          onChanged: registerCubit.changeUserType,
                          value: 'doctor',
                          title: 'Doctor',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const BoxHelper(
                height: 20,
              ),
              state is RegisterLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RegisterButton(
                      title: 'Register',
                      radius: 10,
                      onPressed: () => registerCubit.register(context),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account ',
                        style: MainTheme.subTextStyle,
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            N.back();
                          },
                        text: 'Login',
                        style: MainTheme.subTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MainStyle.mainColorDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
