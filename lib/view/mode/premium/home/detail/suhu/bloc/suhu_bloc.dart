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

    on<TemperatureConversion>(
      (event, emit) {
        switch (event.conversionType) {
          case TemperatureConversionType.celsiusToCelsius:
            _celsiusToCelsius(event, emit);
            break;
          case TemperatureConversionType.celsiusToFahrenheit:
            _celsiusToFahrenheit(event, emit);
            break;
          case TemperatureConversionType.celsiusToKelvin:
            _celsiusToKelvin(event, emit);
            break;
          case TemperatureConversionType.fahrenheitToCelsius:
            _fahrenheitToCelsius(event, emit);
            break;
          case TemperatureConversionType.fahrenheitToFahrenheit:
            _fahrenheitToFahrenheit(event, emit);
            break;
          case TemperatureConversionType.fahrenheitToKelvin:
            _fahrenheitToKelvin(event, emit);
            break;
          case TemperatureConversionType.kelvinToCelsius:
            _kelvinToCelsius(event, emit);
            break;
          case TemperatureConversionType.kelvinToFahrenheit:
            _kelvinToFahrenheit(event, emit);
            break;
          case TemperatureConversionType.kelvinToKelvin:
            _kelvinToKelvin(event, emit);
            break;
          default:
        }
      },
    );
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
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _celsiusToFahrenheit(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    double c = (event.value * 1.8) + 32;
    int result = c.toInt();
    double remainder = c - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': c.toString()});
    }
  }

  _celsiusToKelvin(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    double c = event.value + 273.15;
    int result = c.toInt();
    double remainder = c - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': c.toString()});
    }
  }

  _fahrenheitToFahrenheit(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _fahrenheitToCelsius(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    double f = (event.value - 32) * 0.556;
    int result = f.toInt();
    double remainder = f - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': f.toString()});
    }
  }

  _fahrenheitToKelvin(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    double f = (event.value - 32) * 0.556 + 273.15;
    int result = f.toInt();
    double remainder = f - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': f.toString()});
    }
  }

  _kelvinToCelsius(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    double k = event.value - 273.15;
    int result = k.toInt();
    double remainder = k - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': k.toString()});
    }
  }

  _kelvinToKelvin(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _kelvinToFahrenheit(
      TemperatureConversion event, Emitter<Map<String, dynamic>> emit) {
    double k = (event.value - 273.15) * 1.8 + 32;
    int result = k.toInt();
    double remainder = k - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': k.toString()});
    }
  }
}
