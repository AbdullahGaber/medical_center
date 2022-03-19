part of 'sign_out_cubit.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

class SignOutInitial extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutError extends SignOutState {}

class SignOutNetworkError extends SignOutState {}

class SignOutDone extends SignOutState {}
