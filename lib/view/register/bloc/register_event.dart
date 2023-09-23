// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class EmailEvent extends RegisterEvent {
  final String email;
  EmailEvent({
    required this.email,
  });
}

class PasswordEvent extends RegisterEvent {
  final String password;
  PasswordEvent({
    required this.password,
  });
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;
  ConfirmPasswordEvent({
    required this.confirmPassword,
  });
}
