import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'long_event.dart';

class LongBloc extends Bloc<LongEvent, Map<String, dynamic>> {
  LongBloc()
      : super({
          'resultValue': '',
          'dropDownMenuInput': '',
          'dropDownMenuResult': ''
        }) {
    //bloc for DropDownMenu
    on<DropDownMenuInput>(_dropDownMenuInput);
    on<DropDownMenuResult>(_dropDownMenuResult);

    //bloc for logic math
    on<CmToMeter>(_cmToMeter);
    on<CmToCm>(_cmToCm);
    on<MeterToMeter>(_meterToMeter);
    on<MeterToCm>(_meterToCm);

    // on<DropDownMenuInput>((event, emit) {
    //   emit({...state, 'dropDownMenuInput': event.dropDownMenuInput});
    // });
    // on<DropDownMenuResult>((event, emit) {
    //   emit({...state, 'dropDownMenuResult': event.dropDownMenuResult});
    // });
    // on<CmToMeter>((event, emit) {
    //   double sentiMeter = event.cm / 100;
    //   int result = sentiMeter.toInt();
    //   double remainder = sentiMeter - result.toDouble();
    //   if (remainder == 0) {
    //     emit({...state, 'resultValue': result.toString()});
    //     print('hasil = $result');
    //   } else {
    //     emit({...state, 'resultValue': sentiMeter.toString()});
    //     print('hasil = $sentiMeter');
    //   }
    // });
    // on<CmToCm>((event, emit) {
    //   emit({...state, 'resultValue': event.cm.toInt().toString()});
    // });

    // on<MeterToMeter>((event, emit) {
    //   emit({...state, 'resultValue': event.m.toInt().toString()});
    // });
    // on<MeterToCm>((event, emit) {
    //   double meter = event.m * 100;
    //   emit({...state, 'resultValue': meter.toInt().toString()});
    // });
  }
  //bloc for DropDownMenu
  _dropDownMenuInput(
      DropDownMenuInput event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'dropDownMenuInput': event.dropDownMenuInput});
  }

  _dropDownMenuResult(
      DropDownMenuResult event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'dropDownMenuResult': event.dropDownMenuResult});
  }

  //bloc for logic math
  _cmToMeter(CmToMeter event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.cm / 100;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('hasil = $result');
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
      print('hasil = $sentiMeter');
    }
  }

  _cmToCm(CmToCm event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.cm.toInt().toString()});
  }

  _meterToMeter(MeterToMeter event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.m.toInt().toString()});
  }

  _meterToCm(MeterToCm event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.m * 100;
    emit({...state, 'resultValue': meter.toInt().toString()});
  }
}
