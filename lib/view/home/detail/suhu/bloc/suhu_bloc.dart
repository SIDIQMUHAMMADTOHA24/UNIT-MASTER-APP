import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'suhu_event.dart';

class SuhuBloc extends Bloc<SuhuEvent, Map<String, dynamic>> {
  SuhuBloc()
      : super({
          'resultValue': '0',
          'dropDownMenuInput': '',
          'dropDownMenuResult': '',
          'fontSize': 0.0,
          'formula': ''
        }) {
    //bloc for show formula
    on<ShowFormula>(_isShowFormula);

    //bloc for resize
    on<FontSize>(_fontSize);

    //bloc for DropDownMenu
    on<DropDownMenuInput>(_dropDownMenuInput);
    on<DropDownMenuResult>(_dropDownMenuResult);

    //bloc for math
    on<CelsiusToCelsius>(_celsiusToCelsius);
    on<CelsiusToFahrenheit>(_celsiusToFahrenheit);
    on<CelsiusToKelvin>(_celsiusToKelvin);
    on<FahrenheitToCelsius>(_fahrenheitToCelsius);
    on<FahrenheitToFahrenheit>(_fahrenheitToFahrenheit);
    on<FahrenheitToKelvin>(_fahrenheitToKelvin);
    on<KelvinToCelsius>(_kelvinToCelsius);
    on<KelvinToFahrenheit>(_kelvinToFahrenheit);
    on<KelvinToKelvin>(_kelvinToKelvin);
  }

  //bloc for show formula
  _isShowFormula(ShowFormula event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'formula': event.formula});
  }

  //bloc for fontSize
  _fontSize(FontSize event, Emitter<Map<String, dynamic>> emit) {
    final textLength = event.size;
    if (textLength > 7) {
      final newFontSize = 35 - ((textLength - 7) * 4);
      emit({...state, 'fontSize': newFontSize.toDouble()});
    } else {
      emit({...state, 'fontSize': 35.toDouble()});
    }
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

//bloc for math
  _celsiusToCelsius(
      CelsiusToCelsius event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.c.toInt().toString()});
  }

  _celsiusToFahrenheit(
      CelsiusToFahrenheit event, Emitter<Map<String, dynamic>> emit) {
    double c = (event.c * 1.8) + 32;
    int result = c.toInt();
    double remainder = c - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': c.toString()});
    }
  }

  _celsiusToKelvin(CelsiusToKelvin event, Emitter<Map<String, dynamic>> emit) {
    double c = event.c + 273.15;
    int result = c.toInt();
    double remainder = c - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': c.toString()});
    }
  }

  _fahrenheitToFahrenheit(
      FahrenheitToFahrenheit event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.f.toInt().toString()});
  }

  _fahrenheitToCelsius(
      FahrenheitToCelsius event, Emitter<Map<String, dynamic>> emit) {
    double f = (event.f - 32) * 0.556;
    int result = f.toInt();
    double remainder = f - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': f.toString()});
    }
  }

  _fahrenheitToKelvin(
      FahrenheitToKelvin event, Emitter<Map<String, dynamic>> emit) {
    double f = (event.f - 32) * 0.556 + 273.15;
    int result = f.toInt();
    double remainder = f - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': f.toString()});
    }
  }

  _kelvinToCelsius(KelvinToCelsius event, Emitter<Map<String, dynamic>> emit) {
    double k = event.k - 273.15;
    int result = k.toInt();
    double remainder = k - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': k.toString()});
    }
  }

  _kelvinToKelvin(KelvinToKelvin event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.k.toInt().toString()});
  }

  _kelvinToFahrenheit(
      KelvinToFahrenheit event, Emitter<Map<String, dynamic>> emit) {
    double k = (event.k - 273.15) * 1.8 + 32;
    int result = k.toInt();
    double remainder = k - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': k.toString()});
    }
  }
}
