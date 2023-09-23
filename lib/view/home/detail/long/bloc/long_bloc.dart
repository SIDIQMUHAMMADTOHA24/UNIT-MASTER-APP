import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'long_event.dart';

class LongBloc extends Bloc<LongEvent, Map<String, dynamic>> {
  LongBloc()
      : super({
          'resultValue': 0,
          'dropDownMenuInput': 'cm',
          'dropDownMenuResult': 'm',
        }) {
    on<DropDownMenuInput>(_dropDownMenuInput);
    on<DropDownMenuResult>(_dropDownMenuResult);
    on<ConvertSentiMeterToSentiMeter>(_convertSentiMeterToSentiMeter);
    on<ConvertSentiMeterToMeter>(_convertSentiMeterToMeter);
    on<ConvertSentiMeterToMiliMeter>(_convertSentiMeterToMiliMeter);
    on<ConvertSentiMeterToKiloMeter>(_convertSentiMeterToKiloMeter);
    on<ConvertSentiMeterToInch>(_convertSentiMeterToInch);
    on<ConvertMeterToMeter>(_convertMeterToMeter);
    on<ConvertMeterToSentiMeter>(_convertMeterToSentiMeter);
    on<ConvertMeterToKiloMeter>(_convertMeterToKiloMeter);
    on<ConvertMeterToMiliMeter>(_convertMeterToMiliMeter);
    on<ConvertMeterToInch>(_convertMeterToInch);
    on<ConvertKiloMeterToKiloMeter>(_convertKiloMeterToKiloMeter);
    on<ConvertKiloMeterToMiliMeter>(_convertKiloMeterToMiliMeter);
    on<ConvertKiloMeterToSentiMeter>(_convertKiloMeterToSentiMeter);
    on<ConvertKiloMeterToInch>(_convertKiloMeterToInch);
    on<ConvertKiloMeterToMeter>(_convertKiloMeterToMeter);
  }

  //*For Drop Down*

  _dropDownMenuInput(
      DropDownMenuInput event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'dropDownMenuInput': event.dropDownMenuInput});
  }

  _dropDownMenuResult(
      DropDownMenuResult event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'dropDownMenuResult': event.dropDownMenuResult});
  }

  //*For Logic Matematic*
  _convertSentiMeterToSentiMeter(
      ConvertSentiMeterToSentiMeter event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.cm.toInt()});
    print('${event.cm} cm');
  }

  _convertSentiMeterToMeter(
      ConvertSentiMeterToMeter event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.m / 100;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result});
    } else {
      emit({...state, 'resultValue': sentiMeter});
    }
    print('$sentiMeter m');
  }

  _convertSentiMeterToMiliMeter(
      ConvertSentiMeterToMiliMeter event, Emitter<Map<String, dynamic>> emit) {
    double miliMeter = event.mm * 10;
    emit({...state, 'resultValue': miliMeter.toInt()});
    print('$miliMeter mm');
  }

  _convertSentiMeterToKiloMeter(
      ConvertSentiMeterToKiloMeter event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.km / 100000;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result});
      print('$sentiMeter km');
    } else {
      emit({...state, 'resultValue': sentiMeter});
      print('$sentiMeter km');
    }
  }

  _convertSentiMeterToInch(
      ConvertSentiMeterToInch event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.inch / 2.54;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result});
      print('$sentiMeter inch');
    } else {
      emit({...state, 'resultValue': sentiMeter});
      print('$sentiMeter inch');
    }
  }

  _convertMeterToMeter(
      ConvertMeterToMeter event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.m.toInt()});
    print('${event.m.toInt()} m');
  }

  _convertMeterToSentiMeter(
      ConvertMeterToSentiMeter event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.cm * 100;
    emit({...state, 'resultValue': meter.toInt()});
    print('$meter cm');
  }

  _convertMeterToKiloMeter(
      ConvertMeterToKiloMeter event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.km / 1000;
    int result = meter.toInt();
    double remainder = meter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result});
      print('$meter km');
    } else {
      emit({...state, 'resultValue': meter});
      print('$meter km');
    }
  }

  _convertMeterToMiliMeter(
      ConvertMeterToMiliMeter event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.mm * 1000;
    emit({...state, 'resultValue': meter.toInt()});
    print('$meter mm');
  }

  _convertMeterToInch(
      ConvertMeterToInch event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.inch * 39.37;
    int result = meter.toInt();
    double remainder = meter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result});
      print('$meter inch');
    } else {
      emit({...state, 'resultValue': meter});
      print('$meter inch');
    }
  }

  _convertKiloMeterToKiloMeter(
      ConvertKiloMeterToKiloMeter event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.km.toInt()});
    print('${event.km.toInt()} cm');
  }

  _convertKiloMeterToMiliMeter(
      ConvertKiloMeterToMiliMeter event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.mm * 1000000;
    emit({...state, 'resultValue': kiloMeter.toInt()});
    print('$kiloMeter mm');
  }

  _convertKiloMeterToSentiMeter(
      ConvertKiloMeterToSentiMeter event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.cm * 100000;
    emit({...state, 'resultValue': kiloMeter.toInt()});
    print('$kiloMeter cm');
  }

  _convertKiloMeterToInch(
      ConvertKiloMeterToInch event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.inch * 39370;
    int result = kiloMeter.toInt();
    double remainder = kiloMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result});
      print('$kiloMeter inch');
    } else {
      emit({...state, 'resultValue': kiloMeter});
      print('$kiloMeter inch');
    }
  }

  _convertKiloMeterToMeter(
      ConvertKiloMeterToMeter event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.m * 1000;
    emit({...state, 'resultValue': kiloMeter.toInt()});
    print('$kiloMeter m');
  }
}
