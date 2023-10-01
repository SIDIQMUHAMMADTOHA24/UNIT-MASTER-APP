import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'time_event.dart';

class TimeBloc extends Bloc<TimeEvent, Map<String, dynamic>> {
  TimeBloc()
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
    on<TimeConversion>((event, emit) {
      switch (event.conversionType) {
        case TimeConversionType.detikToMenit:
          _detikToMenit(event.value, emit);
          break;
        case TimeConversionType.detikToJam:
          _detikToJam(event.value, emit);
          break;
        case TimeConversionType.detikToHari:
          _detikToHari(event.value, emit);
          break;
        case TimeConversionType.detikToMinggu:
          _detikToMinggu(event.value, emit);
          break;
        case TimeConversionType.detikToBulan:
          _detikToBulan(event.value, emit);
          break;
        case TimeConversionType.detikToTahun:
          _detikToTahun(event.value, emit);
          break;

        default:
          emit(state);
          break;
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

  //bloc for math
  void _detikToMenit(double detik, Emitter<Map<String, dynamic>> emit) {
    double menit = detik / 60;
    emit({...state, 'resultValue': menit.toStringAsFixed(2)});
  }

  void _detikToJam(double detik, Emitter<Map<String, dynamic>> emit) {
    double jam = detik / 3600; // Karena 1 jam = 3600 detik
    emit({...state, 'resultValue': jam.toStringAsFixed(2)});
  }

  void _detikToHari(double detik, Emitter<Map<String, dynamic>> emit) {
    double hari = detik / 86400; // Karena 1 hari = 86400 detik
    emit({...state, 'resultValue': hari.toStringAsFixed(2)});
  }

  void _detikToMinggu(double detik, Emitter<Map<String, dynamic>> emit) {
    double minggu = detik / 604800; // Karena 1 minggu = 604800 detik
    emit({...state, 'resultValue': minggu.toStringAsFixed(2)});
  }

  void _detikToBulan(double detik, Emitter<Map<String, dynamic>> emit) {
    double bulan =
        detik / 2628000; // Karena 1 bulan (rata-rata) ≈ 2628000 detik
    emit({...state, 'resultValue': bulan.toStringAsFixed(2)});
  }

  void _detikToTahun(double detik, Emitter<Map<String, dynamic>> emit) {
    double tahun = detik / 31536000; // Karena 1 tahun ≈ 31536000 detik
    emit({...state, 'resultValue': tahun.toStringAsFixed(2)});
  }
}
