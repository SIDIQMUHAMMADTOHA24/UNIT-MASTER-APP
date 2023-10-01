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
        case TimeConversionType.detikToDetik:
          _detikToDetik(event, emit);
          break;
        case TimeConversionType.detikToMenit:
          _detikToMenit(event, emit);
          break;
        case TimeConversionType.detikToJam:
          _detikToJam(event, emit);
          break;
        case TimeConversionType.detikToHari:
          _detikToHari(event, emit);
          break;
        case TimeConversionType.detikToMinggu:
          _detikToMinggu(event, emit);
          break;
        case TimeConversionType.detikToBulan:
          _detikToBulan(event, emit);
          break;
        case TimeConversionType.detikToTahun:
          _detikToTahun(event, emit);
          break;
        case TimeConversionType.detikToDekade:
          _detikToDekade(event, emit);
          break;
        case TimeConversionType.detikToAbad:
          _detikToAbad(event, emit);
          break;
        case TimeConversionType.menitToMenit:
          _menitToMenit(event, emit);
          break;
        case TimeConversionType.menitToJam:
          _menitToJam(event, emit);
          break;
        case TimeConversionType.menitToHari:
          _menitToHari(event, emit);
          break;
        case TimeConversionType.menitToMinggu:
          _menitToMinggu(event, emit);
          break;
        case TimeConversionType.menitToBulan:
          _menitToBulan(event, emit);
          break;
        case TimeConversionType.menitToTahun:
          _menitToTahun(event, emit);
          break;
        case TimeConversionType.menitToDekade:
          _menitToDekade(event, emit);
          break;
        case TimeConversionType.menitToAbad:
          _menitToAbad(event, emit);
          break;
        case TimeConversionType.jamToDetik:
          _jamToDetik(event, emit);
          break;
        case TimeConversionType.jamToMenit:
          _jamToMenit(event, emit);
          break;
        case TimeConversionType.jamToJam:
          _jamToJam(event, emit);
          break;
        case TimeConversionType.jamToHari:
          _jamToHari(event, emit);
          break;
        case TimeConversionType.jamToMinggu:
          _jamToMinggu(event, emit);
          break;
        case TimeConversionType.jamToBulan:
          _jamToBulan(event, emit);
          break;
        case TimeConversionType.jamToTahun:
          _jamToTahun(event, emit);
          break;
        case TimeConversionType.jamToDekade:
          _jamToDekade(event, emit);
          break;
        case TimeConversionType.jamToAbad:
          _jamToAbad(event, emit);
          break;
        case TimeConversionType.hariToMenit:
          _hariToMenit(event, emit);
          break;
        case TimeConversionType.hariToJam:
          _hariToJam(event, emit);
          break;
        case TimeConversionType.hariToHari:
          _hariToHari(event, emit);
          break;
        case TimeConversionType.hariToMinggu:
          _hariToMinggu(event, emit);
          break;
        case TimeConversionType.hariToBulan:
          _hariToBulan(event, emit);
          break;
        case TimeConversionType.hariToTahun:
          _hariToTahun(event, emit);
          break;
        case TimeConversionType.hariToDekade:
          _hariToDekade(event, emit);
          break;
        case TimeConversionType.hariToAbad:
          _hariToAbad(event, emit);
          break;
        case TimeConversionType.mingguToMenit:
          _mingguToMenit(event, emit);
          break;
        case TimeConversionType.mingguToJam:
          _mingguToJam(event, emit);
          break;
        case TimeConversionType.mingguToHari:
          _mingguToHari(event, emit);
          break;
        case TimeConversionType.mingguToMinggu:
          _mingguToMinggu(event, emit);
          break;
        case TimeConversionType.mingguToBulan:
          _mingguToBulan(event, emit);
          break;
        case TimeConversionType.mingguToTahun:
          _mingguToTahun(event, emit);
          break;
        case TimeConversionType.mingguToDekade:
          _mingguToDekade(event, emit);
          break;
        case TimeConversionType.mingguToAbad:
          _mingguToAbad(event, emit);
          break;
        case TimeConversionType.bulanToDetik:
          _bulanToDetik(event, emit);
          break;
        case TimeConversionType.bulanToMenit:
          _bulanToMenit(event, emit);
          break;
        case TimeConversionType.bulanToJam:
          _bulanToJam(event, emit);
          break;
        case TimeConversionType.bulanToHari:
          _bulanToHari(event, emit);
          break;
        case TimeConversionType.bulanToMinggu:
          _bulanToMinggu(event, emit);
          break;
        case TimeConversionType.bulanToBulan:
          _bulanToBulan(event, emit);
          break;
        case TimeConversionType.bulanToTahun:
          _bulanToTahun(event, emit);
          break;
        case TimeConversionType.bulanToDekade:
          _bulanToDekade(event, emit);
          break;
        case TimeConversionType.bulanToAbad:
          _bulanToAbad(event, emit);
          break;
        case TimeConversionType.tahunToMenit:
          _tahunToMenit(event, emit);
          break;
        case TimeConversionType.tahunToJam:
          _tahunToJam(event, emit);
          break;
        case TimeConversionType.tahunToHari:
          _tahunToHari(event, emit);
          break;
        case TimeConversionType.tahunToMinggu:
          _tahunToMinggu(event, emit);
          break;
        case TimeConversionType.tahunToBulan:
          _tahunToBulan(event, emit);
          break;
        case TimeConversionType.tahunToTahun:
          _tahunToTahun(event, emit);
          break;
        case TimeConversionType.tahunToDekade:
          _tahunToDekade(event, emit);
          break;
        case TimeConversionType.tahunToAbad:
          _tahunToAbad(event, emit);
          break;
        case TimeConversionType.dekadeToMenit:
          _dekadeToMenit(event, emit);
          break;
        case TimeConversionType.dekadeToJam:
          _dekadeToJam(event, emit);
          break;
        case TimeConversionType.dekadeToHari:
          _dekadeToHari(event, emit);
          break;
        case TimeConversionType.dekadeToMinggu:
          _dekadeToMinggu(event, emit);
          break;
        case TimeConversionType.dekadeToBulan:
          _dekadeToBulan(event, emit);
          break;
        case TimeConversionType.dekadeToTahun:
          _dekadeToTahun(event, emit);
          break;
        case TimeConversionType.dekadeToDekade:
          _dekadeToDekade(event, emit);
          break;
        case TimeConversionType.dekadeToAbad:
          _dekadeToAbad(event, emit);
          break;
        case TimeConversionType.abadToMenit:
          _abadToMenit(event, emit);
          break;
        case TimeConversionType.abadToJam:
          _abadToJam(event, emit);
          break;
        case TimeConversionType.abadToHari:
          _abadToHari(event, emit);
          break;
        case TimeConversionType.abadToMinggu:
          _abadToMinggu(event, emit);
          break;
        case TimeConversionType.abadToBulan:
          _abadToBulan(event, emit);
          break;
        case TimeConversionType.abadToTahun:
          _abadToTahun(event, emit);
          break;
        case TimeConversionType.abadToDekade:
          _abadToDekade(event, emit);
          break;
        case TimeConversionType.abadToAbad:
          _abadToAbad(event, emit);
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
  // Konversi dari detik ke yang lain
  _detikToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toInt().toString()});
  }

  _detikToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value / 60;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _detikToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value / 3600;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _detikToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value / 86400;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _detikToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value / 604800;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _detikToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value / 2592000;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _detikToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value / 31536000;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _detikToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 315360000;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _detikToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 3153600000;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _menitToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _menitToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value / 60;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _menitToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value / 1440;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _menitToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value / 10080;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _menitToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value / 43800;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _menitToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value / 525600;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _menitToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 5256000;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _menitToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 52560000;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

// Lanjutkan dengan menambahkan kode yang sesuai untuk setiap fungsi konversi lainnya, seperti jam, hari, minggu, bulan, tahun, dekade, dan abad.

  _jamToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 3600;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _jamToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 60;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _jamToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _jamToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value / 24;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _jamToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value / 168;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _jamToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value / 730.001;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _jamToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value / 8760;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _jamToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 87600;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _jamToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 876000;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _hariToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 86400;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _hariToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 1440;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _hariToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value * 24;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _hariToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _hariToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value / 7;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _hariToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value / 30.417;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _hariToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value / 365.25;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _hariToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 3652.5;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _hariToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 36525;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _mingguToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 604800;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _mingguToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 10080;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _mingguToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value * 168;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _mingguToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value * 7;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _mingguToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _mingguToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value / 4.345;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _mingguToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value / 52.143;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _mingguToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 521.429;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _mingguToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 5214.29;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _bulanToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 2592000;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _bulanToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 43800;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _bulanToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value * 730.001;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _bulanToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value * 30.417;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _bulanToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value * 4.345;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _bulanToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _bulanToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value / 12;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _bulanToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 120;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _bulanToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 1200;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _tahunToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 31536000;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _tahunToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 525600;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _tahunToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value * 8760;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _tahunToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value * 365.25;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _tahunToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value * 52.143;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _tahunToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value * 12;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _tahunToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _tahunToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value / 10;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _tahunToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 100;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _dekadeToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 315360000;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _dekadeToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 5256000;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _dekadeToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value * 87600;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _dekadeToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value * 3652.5;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _dekadeToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value * 521.429;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _dekadeToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value * 120;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _dekadeToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value * 10;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _dekadeToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }

  _dekadeToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double abad = event.value / 10;
    int result = abad.toInt();
    double remainder = abad - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': abad.toString()});
    }
  }

  _abadToDetik(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double detik = event.value * 3153600000;
    int result = detik.toInt();
    double remainder = detik - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': detik.toString()});
    }
  }

  _abadToMenit(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double menit = event.value * 52560000;
    int result = menit.toInt();
    double remainder = menit - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': menit.toString()});
    }
  }

  _abadToJam(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double jam = event.value * 876000;
    int result = jam.toInt();
    double remainder = jam - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': jam.toString()});
    }
  }

  _abadToHari(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double hari = event.value * 36525;
    int result = hari.toInt();
    double remainder = hari - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': hari.toString()});
    }
  }

  _abadToMinggu(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double minggu = event.value * 5214.29;
    int result = minggu.toInt();
    double remainder = minggu - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': minggu.toString()});
    }
  }

  _abadToBulan(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double bulan = event.value * 1200;
    int result = bulan.toInt();
    double remainder = bulan - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': bulan.toString()});
    }
  }

  _abadToTahun(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double tahun = event.value * 100;
    int result = tahun.toInt();
    double remainder = tahun - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': tahun.toString()});
    }
  }

  _abadToDekade(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    double dekade = event.value * 10;
    int result = dekade.toInt();
    double remainder = dekade - result.toDouble();
    if (remainder == 0) {
      emit({...state, 'resultValue': result.toString()});
    } else {
      emit({...state, 'resultValue': dekade.toString()});
    }
  }

  _abadToAbad(TimeConversion event, Emitter<Map<String, dynamic>> emit) {
    emit({...state, 'resultValue': event.value.toString()});
  }
}
