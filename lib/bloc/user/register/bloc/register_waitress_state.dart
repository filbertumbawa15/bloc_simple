part of 'register_waitress_bloc.dart';

@immutable
abstract class RegisterWaitressState {}

class RegisterWaitressInitial extends RegisterWaitressState {}

class RegisterWaitressLoading extends RegisterWaitressState {}

class RegisterWaitressSuccess extends RegisterWaitressState {
  final RegisterUserResponse registerUserResponse;
  RegisterWaitressSuccess({required this.registerUserResponse});
}

class RegisterWaitressError extends RegisterWaitressState {
  final String message;
  RegisterWaitressError({required this.message});
}
