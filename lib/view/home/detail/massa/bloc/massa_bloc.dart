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
    //bloc for DropDownMenu
    on<DropDownMenuInput>(_dropDownMenuInput);
    on<DropDownMenuResult>(_dropDownMenuResult);

    //bloc for logic
    on<KgToGram>(_kgToGram);
    on<KgToKg>(_kgToKg);
    on<KgToOunce>(_kgToOunce);
    on<KgToTon>(_kgToTon);
    on<KgToPound>(_kgToPound);
    on<KgToMg>(_kgToMg);
    on<GramToKg>(_gramToKg);
    on<GramToGram>(_gramToGram);
    on<GramToTon>(_gramToTon);
    on<GramToOunce>(_gramToOunce);
    on<GramToPound>(_gramToPound);
    on<GramToMg>(_gramToMg);
    on<TonToKg>(_tonToKg);
    on<TonToGram>(_tonToGram);
    on<TonToMg>(_tonToMg);
    on<TonToOunce>(_tonToOunce);
    on<TonToPound>(_tonToPound);
    on<TonToTon>(_tonToTon);
    on<OunceToOunce>(_ounceToOunce);
    on<OunceToGram>(_ounceToGram);
    on<OunceToKg>(_ounceToKg);
    on<OunceToMg>(_ounceToMg);
    on<OunceToPound>(_ounceToPound);
    on<OunceToTon>(_ounceToTon);
    on<MgToGram>(_mgToGram);
    on<MgToKg>(_mgToKg);
    on<MgToOunce>(_mgToOunce);
    on<MgToPound>(_mgToPound);
    on<MgToMg>(_mgToMg);
    on<MgToTon>(_mgToTon);
    on<PoundToGram>(_poundToGram);
    on<PoundToKg>(_poundToKg);
    on<PoundToMg>(_poundToMg);
    on<PoundToOunce>(_poundToOunce);
    on<PoundToTon>(_poundToTon);
    on<PoundToPound>(_poundToPound);
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
  _kgToGram(KgToGram event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.kg / 1000;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToKg(KgToKg event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.kg.toInt().toString()});
  }

  _kgToOunce(KgToOunce event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.kg * 35.274;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToTon(KgToTon event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.kg / 1000;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToPound(KgToPound event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.kg * 2.20462;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _kgToMg(KgToMg event, Emitter<Map<String, dynamic>> emit) {
    double kg = event.kg * 1000000;
    int result = kg.toInt();
    double remainder = kg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': kg.toString()});
    }
  }

  _gramToKg(GramToKg event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.gram / 1000;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToGram(GramToGram event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.gram.toInt().toString()});
  }

  _gramToTon(GramToTon event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.gram / 1000000;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToOunce(GramToOunce event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.gram / 28.35;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToPound(GramToPound event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.gram / 453.6;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _gramToMg(GramToMg event, Emitter<Map<String, dynamic>> emit) {
    double gram = event.gram * 1000;
    int result = gram.toInt();
    double remainder = gram - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': gram.toString()});
    }
  }

  _tonToTon(TonToTon event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.ton.toInt().toString()});
  }

  _tonToKg(TonToKg event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.ton * 1000;
    emit({...state, 'resultValue': ton.toString()});
  }

  _tonToGram(TonToGram event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.ton * 1000000;
    emit({...state, 'resultValue': ton.toString()});
  }

  _tonToPound(TonToPound event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.ton * 2204.62;
    int result = ton.toInt();
    double remainder = ton - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ton.toString()});
    }
  }

  _tonToOunce(TonToOunce event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.ton * 35273.96;
    int result = ton.toInt();
    double remainder = ton - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ton.toString()});
    }
  }

  _tonToMg(TonToMg event, Emitter<Map<String, dynamic>> emit) {
    double ton = event.ton * 1000000000;
    int result = ton.toInt();
    double remainder = ton - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ton.toString()});
    }
  }

  _ounceToKg(OunceToKg event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.ounce * 0.0283495;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _ounceToGram(OunceToGram event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.ounce * 28.3495;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _ounceToOunce(OunceToOunce event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.ounce.toInt().toString()});
  }

  _ounceToPound(OunceToPound event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.ounce * 0.0625;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _ounceToMg(OunceToMg event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.ounce * 28.3495;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _ounceToTon(OunceToTon event, Emitter<Map<String, dynamic>> emit) {
    double ounce = event.ounce * 0.0000283495;
    int result = ounce.toInt();
    double remainder = ounce - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': ounce.toString()});
    }
  }

  _mgToGram(MgToGram event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.mg / 1000;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToKg(MgToKg event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.mg / 1000000;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToOunce(MgToOunce event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.mg / 28350;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToMg(MgToMg event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.mg.toInt().toString()});
  }

  _mgToPound(MgToPound event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.mg / 453600;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _mgToTon(MgToTon event, Emitter<Map<String, dynamic>> emit) {
    double mg = event.mg * 1000000;
    int result = mg.toInt();
    double remainder = mg - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': mg.toString()});
    }
  }

  _poundToPound(PoundToPound event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.pound.toInt().toString()});
  }

  _poundToGram(PoundToGram event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.pound * 453.6;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToKg(PoundToKg event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.pound / 2.205;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToMg(PoundToMg event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.pound * 453600;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToTon(PoundToTon event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.pound * 0.000453592;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }

  _poundToOunce(PoundToOunce event, Emitter<Map<String, dynamic>> emit) {
    double pound = event.pound * 16;
    int result = pound.toInt();
    double remainder = pound - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': pound.toString()});
    }
  }
}
