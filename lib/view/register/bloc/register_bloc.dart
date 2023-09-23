import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<EmailEvent>(_email);
    on<PasswordEvent>(_password);
    on<ConfirmPasswordEvent>(_confirmPassword);
  }
  _email(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _password(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _confirmPassword(ConfirmPasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
