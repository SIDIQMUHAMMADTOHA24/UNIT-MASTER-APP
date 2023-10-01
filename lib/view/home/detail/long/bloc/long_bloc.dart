import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'long_event.dart';

class LongBloc extends Bloc<LongEvent, Map<String, dynamic>> {
  LongBloc()
      : super({
          'resultValue': '0',
          'dropDownMenuInput': 'm',
          'dropDownMenuResult': 'm',
          'fontSize': 0.0,
          'formula': ''
        }) {
    //bloc for show formula
    on<ShowFormula>(_isShowFormula);

    //bloc for fontSize
    on<FontSize>(_fontSize);

    //bloc for DropDownMenu
    on<DropDownMenuInput>(_dropDownMenuInput);
    on<DropDownMenuResult>(_dropDownMenuResult);
    on<LengthConversion>((event, emit) {
      switch (event.conversionType) {
        case LengthConversionType.cmToCm:
          _cmToCm(event, emit);
          break;
        case LengthConversionType.cmToMm:
          _cmToMm(event, emit);
          break;
        case LengthConversionType.cmToKm:
          _cmToKm(event, emit);
          break;
        case LengthConversionType.cmToInch:
          _cmToInch(event, emit);
          break;
        case LengthConversionType.cmToMeter:
          _cmToMeter(event, emit);
          break;
        case LengthConversionType.meterToCm:
          _meterToCm(event, emit);
          break;
        case LengthConversionType.meterToInch:
          _meterToInch(event, emit);
          break;
        case LengthConversionType.meterToMeter:
          _meterToMeter(event, emit);
          break;
        case LengthConversionType.meterToMm:
          _meterToMm(event, emit);
          break;
        case LengthConversionType.meterToKm:
          _meterToKm(event, emit);
          break;
        case LengthConversionType.inchToInch:
          _inchToInch(event, emit);
          break;
        case LengthConversionType.inchToMeter:
          _inchToMeter(event, emit);
          break;
        case LengthConversionType.inchToCm:
          _inchToCm(event, emit);
          break;
        case LengthConversionType.inchToKm:
          _inchToKm(event, emit);
          break;
        case LengthConversionType.inchToMm:
          _inchToMm(event, emit);
          break;
        case LengthConversionType.mmToMm:
          _mmToMm(event, emit);
          break;
        case LengthConversionType.mmToCm:
          _mmToCm(event, emit);
          break;
        case LengthConversionType.mmToKm:
          _mmToKm(event, emit);
          break;
        case LengthConversionType.mmToMeter:
          _mmToMeter(event, emit);
          break;
        case LengthConversionType.mmToInch:
          _mmToInch(event, emit);
          break;
        case LengthConversionType.kmToKm:
          _kmToKm(event, emit);
          break;
        case LengthConversionType.kmToMm:
          _kmToMm(event, emit);
          break;
        case LengthConversionType.kmToCm:
          _kmToCm(event, emit);
          break;
        case LengthConversionType.kmToMeter:
          _kmToMeter(event, emit);
          break;
        case LengthConversionType.kmToInch:
          _kmToInch(event, emit);
          break;
        default:
      }
    });
  }

  //bloc for show formula
  _isShowFormula(ShowFormula event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'formula': event.formula});
  }

  //bloc for fontSize
  _fontSize(FontSize event, Emitter<Map<String, dynamic>> emit) {
    final textLength = event.size;
    if (textLength > 3) {
      final newFontSize = 35 - ((textLength - 6) * 4);
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

  //bloc for logic math
  _cmToMeter(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 100;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _cmToCm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _cmToMm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double miliMeter = event.value * 10;
    emit({...state, 'resultValue': miliMeter.toInt().toString()});
  }

  _cmToInch(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 2.54;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _cmToKm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 100000;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _meterToMeter(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _meterToCm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.value * 100;
    emit({...state, 'resultValue': meter.toInt().toString()});
  }

  _meterToMm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.value * 1000;
    emit({...state, 'resultValue': meter.toInt().toString()});
  }

  _meterToInch(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.value * 39.37;
    int result = meter.toInt();
    double remainder = meter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': meter.toString()});
    }
  }

  _meterToKm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.value / 1000;
    int result = meter.toInt();
    double remainder = meter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': meter.toString()});
    }
  }

  _inchToInch(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _inchToMeter(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double inch = event.value / 39.37;
    int result = inch.toInt();
    double remainder = inch - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': inch.toString()});
    }
  }

  _inchToCm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double inch = event.value * 2.54;
    int result = inch.toInt();
    double remainder = inch - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': inch.toString()});
    }
  }

  _inchToMm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double inch = event.value * 25.4;
    int result = inch.toInt();
    double remainder = inch - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': inch.toString()});
    }
  }

  _inchToKm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value * 0.0000254;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _mmToMm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _mmToCm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 10;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _mmToMeter(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 1000;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _mmToKm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 1000000;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _mmToInch(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.value / 25.4;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
    }
  }

  _kmToKm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _kmToMm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.value * 1000000;
    emit({...state, 'resultValue': kiloMeter.toInt().toString()});
  }

  _kmToMeter(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.value * 1000;
    emit({...state, 'resultValue': kiloMeter.toInt().toString()});
  }

  _kmToCm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.value * 100000;
    emit({...state, 'resultValue': kiloMeter.toInt().toString()});
  }

  _kmToInch(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.value * 39370;
    int result = kiloMeter.toInt();
    double remainder = kiloMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kiloMeter.toString()});
    }
  }
}
