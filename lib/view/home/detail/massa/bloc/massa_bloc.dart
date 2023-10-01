import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'massa_event.dart';

class MassaBloc extends Bloc<MassaEvent, Map<String, dynamic>> {
  MassaBloc()
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

    //bloc for logic
    on<MassaConversion>((event, emit) {
      switch (event.conversionType) {
        case MassaConversionType.gramToGram:
          _gramToGram(event, emit);
          break;
        case MassaConversionType.gramToKg:
          _gramToKg(event, emit);
          break;
        case MassaConversionType.gramToTon:
          _gramToTon(event, emit);
          break;
        case MassaConversionType.gramToOunce:
          _gramToOunce(event, emit);
          break;
        case MassaConversionType.gramToPound:
          _gramToPound(event, emit);
          break;
        case MassaConversionType.gramToMg:
          _gramToMg(event, emit);
          break;
        case MassaConversionType.kgToKg:
          _kgToKg(event, emit);
          break;
        case MassaConversionType.kgToGram:
          _kgToGram(event, emit);
          break;
        case MassaConversionType.kgToOunce:
          _kgToOunce(event, emit);
          break;
        case MassaConversionType.kgToTon:
          _kgToTon(event, emit);
          break;
        case MassaConversionType.kgToPound:
          _kgToPound(event, emit);
          break;
        case MassaConversionType.kgToMg:
          _kgToMg(event, emit);
          break;
        case MassaConversionType.tonToTon:
          _tonToTon(event, emit);
          break;
        case MassaConversionType.tonToKg:
          _tonToKg(event, emit);
          break;
        case MassaConversionType.tonToGram:
          _tonToGram(event, emit);
          break;
        case MassaConversionType.tonToPound:
          _tonToPound(event, emit);
          break;
        case MassaConversionType.tonToOunce:
          _tonToOunce(event, emit);
          break;
        case MassaConversionType.tonToMg:
          _tonToMg(event, emit);
          break;
        case MassaConversionType.ounceToKg:
          _ounceToKg(event, emit);
          break;
        case MassaConversionType.ounceToGram:
          _ounceToGram(event, emit);
          break;
        case MassaConversionType.ounceToOunce:
          _ounceToOunce(event, emit);
          break;
        case MassaConversionType.ounceToPound:
          _ounceToPound(event, emit);
          break;
        case MassaConversionType.mgToKg:
          _mgToKg(event, emit);
          break;
        case MassaConversionType.mgToOunce:
          _mgToOunce(event, emit);
          break;
        case MassaConversionType.mgToMg:
          _mgToMg(event, emit);
          break;
        case MassaConversionType.mgToPound:
          _mgToPound(event, emit);
          break;
        case MassaConversionType.mgToTon:
          _mgToTon(event, emit);
          break;
        case MassaConversionType.poundToPound:
          _poundToPound(event, emit);
          break;
        case MassaConversionType.poundToGram:
          _poundToGram(event, emit);
          break;
        case MassaConversionType.poundToKg:
          _poundToKg(event, emit);
          break;
        case MassaConversionType.poundToMg:
          _poundToMg(event, emit);
          break;
        case MassaConversionType.poundToTon:
          _poundToTon(event, emit);
          break;
        case MassaConversionType.poundToOunce:
          _poundToOunce(event, emit);
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

//bloc for logic
  _kgToGram(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.value * 1000;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToKg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _kgToOunce(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.value * 35.274;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToTon(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.value / 1000;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToPound(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.value * 2.20462;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToMg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.value * 1000000;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _gramToKg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.value / 1000;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToGram(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _gramToTon(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.value / 1000000;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToOunce(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.value / 28.35;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToPound(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.value / 453.6;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToMg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.value * 1000;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _tonToTon(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _tonToKg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.value * 1000;
    emit({...state, 'resultValue': ton.toInt().toString()});
  }

  _tonToGram(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.value * 1000000;
    emit({...state, 'resultValue': ton.toInt().toString()});
  }

  _tonToPound(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.value * 2204.62;
    int result = ton.toInt();
    double remainder = ton - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ton.toString()});
    }
  }

  _tonToOunce(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.value * 35273961;
    int result = ton.toInt();
    double remainder = ton - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ton.toString()});
    }
  }

  _tonToMg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.value * 1000000000;
    int result = ton.toInt();
    double remainder = ton - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ton.toString()});
    }
  }

  _ounceToKg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.value * 0.0283495;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _ounceToGram(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.value * 28.3495;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _ounceToOunce(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _ounceToPound(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.value * 0.0625;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _mgToKg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.value / 1000000;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToOunce(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.value / 28350;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToMg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _mgToPound(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.value / 453600;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToTon(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.value * 1000000;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _poundToPound(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _poundToGram(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.value * 453.6;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToKg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.value / 2.205;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToMg(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.value * 453600;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToTon(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.value * 0.000453592;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToOunce(MassaConversion event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.value * 16;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }
}
