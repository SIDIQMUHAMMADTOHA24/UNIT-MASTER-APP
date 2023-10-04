part of 'mode_gratis_bloc.dart';

@immutable
sealed class ModeGratisEvent {}

//event for fontSize
class FontSize extends ModeGratisEvent {
  final double size;
  FontSize({
    required this.size,
  });
}

//Event for DropDownMenu
class DropDownMenuInput extends ModeGratisEvent {
  final String dropDownMenuInput;
  DropDownMenuInput({
    required this.dropDownMenuInput,
  });
}

class DropDownMenuResult extends ModeGratisEvent {
  final String dropDownMenuResult;
  DropDownMenuResult({
    required this.dropDownMenuResult,
  });
}

class ShowFormula extends ModeGratisEvent {
  final String formula;
  ShowFormula({
    required this.formula,
  });
}

enum LengthConversionType {
  cmToMeter,
  cmToCm,
  meterToMeter,
  meterToCm,
}

class LengthConversion extends ModeGratisEvent {
  final double value;
  final LengthConversionType conversionType;
  LengthConversion({
    required this.value,
    required this.conversionType,
  });
}
