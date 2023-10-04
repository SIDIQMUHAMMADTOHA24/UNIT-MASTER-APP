import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mode_gratis_event.dart';

class ModeGratisBloc extends Bloc<ModeGratisEvent, Map<String, dynamic>> {
  ModeGratisBloc()
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
        case LengthConversionType.cmToMeter:
          _cmToMeter(event, emit);
          break;
        case LengthConversionType.meterToCm:
          _meterToCm(event, emit);
          break;
        case LengthConversionType.meterToMeter:
          _meterToMeter(event, emit);
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

  _meterToMeter(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _meterToCm(LengthConversion event, Emitter<Map<String, dynamic>> emit) {
    double meter = event.value * 100;
    emit({...state, 'resultValue': meter.toInt().toString()});
  }
}
