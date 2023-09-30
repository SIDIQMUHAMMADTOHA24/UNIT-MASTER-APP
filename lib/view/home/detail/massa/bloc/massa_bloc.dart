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

}
