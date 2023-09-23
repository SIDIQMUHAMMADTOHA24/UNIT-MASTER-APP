import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'testing_event.dart';
part 'testing_state.dart';

class TestingBloc extends Bloc<TestingEvent, int> {
  TestingBloc() : super(0) {
    on<Incremennt>((event, emit) {
      emit(state + 1);
    });
  }
}
