import 'package:bloc/bloc.dart';

part 'dot_indicator_event.dart';
part 'dot_indicator_state.dart';

class DotIndicatorBloc extends Bloc<DotIndicatorEvent, DotIndicatorState> {
  DotIndicatorBloc() : super(DotIndicatorState()) {
    on<DotIndicatorEvent>((event, emit) {
      emit(DotIndicatorState(page: state.page));
    });
  }
}
