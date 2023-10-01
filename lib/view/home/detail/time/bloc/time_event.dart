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
  detikToJam,
  detikToMenit,
  detikToHari,
  detikToMinggu,
  detikToBulan,
  detikToTahun,
  detikToDekade,
  detikToAbad,
  menitToJam,
  menitToHari,
  menitToMinggu,
  menitToBulan,
  menitToTahun,
  menitToDekade,
  menitToAbad,
  jamToHari,
  jamToMinggu,
  jamToBulan,
  jamToTahun,
  jamToDekade,
  jamToAbad,
  hariToMinggu,
  hariToBulan,
  hariToTahun,
  hariToDekade,
  hariToAbad,
  mingguToBulan,
  mingguToTahun,
  mingguToDekade,
  mingguToAbad,
  bulanToTahun,
  bulanToDekade,
  bulanToAbad,
  tahunToDekade,
  tahunToAbad,
  dekadeToAbad,
}

class TimeConversion extends TimeEvent {
  final double value;
  final TimeConversionType conversionType;

  TimeConversion({required this.value, required this.conversionType});
}
