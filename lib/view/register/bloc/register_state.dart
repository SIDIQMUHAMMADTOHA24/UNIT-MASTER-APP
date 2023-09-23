// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState {
  final String email;
  final String password;
  final String confirmPassword;
  RegisterState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  RegisterState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
