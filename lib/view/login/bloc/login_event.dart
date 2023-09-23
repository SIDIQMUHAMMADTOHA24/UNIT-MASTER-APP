// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class EmailEvent extends LoginEvent {
  final String email;
  EmailEvent({
    required this.email,
  });
}

class PasswordEvent extends LoginEvent {
  final String password;
  PasswordEvent({
    required this.password,
  });
}
