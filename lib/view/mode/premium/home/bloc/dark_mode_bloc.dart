import 'package:bloc/bloc.dart';

part 'dark_mode_event.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, bool> {
  DarkModeBloc() : super(false) {
    on<DarkModeEvent>((event, emit) => emit(!state));
  }
}
