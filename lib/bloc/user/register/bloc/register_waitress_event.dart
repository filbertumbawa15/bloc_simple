part of 'register_waitress_bloc.dart';

@immutable
abstract class RegisterWaitressEvent {}

class CreateWaitressEvent extends RegisterWaitressEvent {
  String? username;
  String? email;
  bool? isActive;
  bool? isWaitress;
  String? firstName;
  String? lastName;
  String? password1;
  String? password2;

  CreateWaitressEvent(
      {required this.username,
      required this.email,
      required this.isActive,
      required this.isWaitress,
      required this.firstName,
      required this.lastName,
      required this.password1,
      required this.password2});
}
