part of 'time_bloc.dart';

@immutable
sealed class TimeEvent {}

//Event for resize
class FontSize extends TimeEvent {
  final double size;
  FontSize({
    required this.size,
  });
}

//Event for DropDownMenu
class DropDownMenuInput extends TimeEvent {
  final String dropDownMenuInput;
  DropDownMenuInput({
    required this.dropDownMenuInput,
  });
}

class DropDownMenuResult extends TimeEvent {
  final String dropDownMenuResult;
  DropDownMenuResult({
    required this.dropDownMenuResult,
  });
}

class ShowFormula extends TimeEvent {
  final String formula;
  ShowFormula({
    required this.formula,
  });
}

enum TimeConversionType {
  // Detik ke ...
  detikToDetik,
  detikToMenit,
  detikToJam,
  detikToHari,
  detikToMinggu,
  detikToBulan,
  detikToTahun,
  detikToDekade,
  detikToAbad,

  // Menit ke ...
  menitToDetik,
  menitToMenit,
  menitToJam,
  menitToHari,
  menitToMinggu,
  menitToBulan,
  menitToTahun,
  menitToDekade,
  menitToAbad,

  // Jam ke ...
  jamToDetik,
  jamToMenit,
  jamToJam,
  jamToHari,
  jamToMinggu,
  jamToBulan,
  jamToTahun,
  jamToDekade,
  jamToAbad,

  // Hari ke ...
  hariToDetik,
  hariToMenit,
  hariToJam,
  hariToHari,
  hariToMinggu,
  hariToBulan,
  hariToTahun,
  hariToDekade,
  hariToAbad,

  // Minggu ke ...
  mingguToDetik,
  mingguToJam,
  mingguToMenit,
  mingguToHari,
  mingguToMinggu,
  mingguToBulan,
  mingguToTahun,
  mingguToDekade,
  mingguToAbad,

  // Bulan ke ...
  bulanToDetik,
  bulanToMenit,
  bulanToJam,
  bulanToHari,
  bulanToMinggu,
  bulanToBulan,
  bulanToTahun,
  bulanToDekade,
  bulanToAbad,

  // Tahun ke ...
  tahunToDetik,
  tahunToMenit,
  tahunToJam,
  tahunToHari,
  tahunToMinggu,
  tahunToBulan,
  tahunToTahun,
  tahunToDekade,
  tahunToAbad,

  // Dekade ke ...
  dekadeToDetik,
  dekadeToMenit,
  dekadeToJam,
  dekadeToHari,
  dekadeToMinggu,
  dekadeToTahun,
  dekadeToBulan,
  dekadeToDekade,
  dekadeToAbad,

  // Abad ke ...
  abadToDetik,
  abadToMenit,
  abadToJam,
  abadToHari,
  abadToMinggu,
  abadToBulan,
  abadToTahun,
  abadToDekade,
  abadToAbad,
}

class TimeConversion extends TimeEvent {
  final double value;
  final TimeConversionType conversionType;

  TimeConversion({required this.value, required this.conversionType});
}
