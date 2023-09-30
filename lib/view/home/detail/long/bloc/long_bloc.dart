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

    //bloc for logic math
    on<CmToMeter>(_cmToMeter);
    on<CmToCm>(_cmToCm);
    on<CmToMm>(_cmToMm);
    on<CmToInch>(_cmToInch);
    on<CmToKm>(_cmToKm);
    on<MeterToMeter>(_meterToMeter);
    on<MeterToCm>(_meterToCm);
    on<MeterToMm>(_meterToMm);
    on<MeterToInch>(_meterToInch);
    on<MeterToKm>(_meterToKm);
    on<InchToInch>(_inchToInch);
    on<InchToCm>(_inchToCm);
    on<InchToMeter>(_inchToMeter);
    on<InchToKm>(_inchToKm);
    on<InchToMm>(_inchToMm);
    on<MmToMm>(_mmToMm);
    on<MmToMeter>(_mmToMeter);
    on<MmToKm>(_mmToKm);
    on<MmToCm>(_mmToCm);
    on<MmToInch>(_mmToInch);
    on<KmToKm>(_kmToKm);
    on<KmToMeter>(_kmToMeter);
    on<KmToCm>(_kmToCm);
    on<KmToMm>(_kmToMm);
    on<KmToInch>(_kmToInch);
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

  _cmToMm(CmToMm event, Emitter<Map<String, dynamic>> emit) {
    double miliMeter = event.cm * 10;
    emit({...state, 'resultValue': miliMeter.toInt().toString()});
  }

  _cmToInch(CmToInch event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.cm / 2.54;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('$sentiMeter inch');
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
      print('$sentiMeter inch');
    }
  }

  _cmToKm(CmToKm event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.cm / 100000;
    int result = sentiMeter.toInt();
    double remainder = sentiMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('$sentiMeter km');
    } else {
      emit({...state, 'resultValue': sentiMeter.toString()});
      print('$sentiMeter km');
    }
  }

  _meterToMeter(MeterToMeter event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.m.toInt().toString()});
  }

  _meterToCm(MeterToCm event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.m * 100;
    emit({...state, 'resultValue': meter.toInt().toString()});
  }

  _meterToMm(MeterToMm event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.m * 1000;
    emit({...state, 'resultValue': meter.toInt().toString()});
  }

  _meterToInch(MeterToInch event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.m * 39.37;
    int result = meter.toInt();
    double remainder = meter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('$meter inch');
    } else {
      emit({...state, 'resultValue': meter.toString()});
      print('$meter inch');
    }
  }

  _meterToKm(MeterToKm event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.m / 1000;
    int result = meter.toInt();
    double remainder = meter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('$meter km');
    } else {
      emit({...state, 'resultValue': meter.toString()});
      print('$meter km');
    }
  }

  _inchToInch(InchToInch event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.inch.toInt().toString()});
  }

  _inchToMeter(InchToMeter event, Emitter<Map<String, dynamic>> emit) {
    double inch = event.inch / 39.37;
    int result = inch.toInt();
    double remainder = inch - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('hasil = $result');
    } else {
      emit({...state, 'resultValue': inch.toString()});
      print('hasil = $inch');
    }
  }

  _inchToCm(InchToCm event, Emitter<Map<String, dynamic>> emit) {
    double inch = event.inch * 2.54;
    int result = inch.toInt();
    double remainder = inch - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('hasil = $result');
    } else {
      emit({...state, 'resultValue': inch.toString()});
      print('hasil = $inch');
    }
  }

  _inchToMm(InchToMm event, Emitter<Map<String, dynamic>> emit) {
    double inch = event.inch * 25.4;
    int result = inch.toInt();
    double remainder = inch - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('hasil = $result');
    } else {
      emit({...state, 'resultValue': inch.toString()});
      print('hasil = $inch');
    }
  }

  _inchToKm(InchToKm event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.inch * 0.0000254;
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

  _mmToMm(MmToMm event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.mm.toInt().toString()});
  }

  _mmToCm(MmToCm event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.mm / 10;
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

  _mmToMeter(MmToMeter event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.mm / 1000;
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

  _mmToKm(MmToKm event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.mm / 1000000;
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

  _mmToInch(MmToInch event, Emitter<Map<String, dynamic>> emit) {
    double sentiMeter = event.mm / 25.4;
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

  _kmToKm(KmToKm event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.km.toInt().toString()});
  }

  _kmToMm(KmToMm event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.km * 1000000;
    emit({...state, 'resultValue': kiloMeter.toInt().toString()});
  }

  _kmToMeter(KmToMeter event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.km * 1000;
    emit({...state, 'resultValue': kiloMeter.toInt().toString()});
  }

  _kmToCm(KmToCm event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.km * 100000;
    emit({...state, 'resultValue': kiloMeter.toInt().toString()});
  }

  _kmToInch(KmToInch event, Emitter<Map<String, dynamic>> emit) {
    double kiloMeter = event.km * 39370;
    int result = kiloMeter.toInt();
    double remainder = kiloMeter - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
      print('$kiloMeter inch');
    } else {
      emit({...state, 'resultValue': kiloMeter.toString()});
      print('$kiloMeter inch');
    }
  }
}
