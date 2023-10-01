// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'massa_bloc.dart';

@immutable
sealed class MassaEvent {}

//Event for resize
class FontSize extends MassaEvent {
  final double size;
  FontSize({
    required this.size,
  });
}

//Event for DropDownMenu
class DropDownMenuInput extends MassaEvent {
  final String dropDownMenuInput;
  DropDownMenuInput({
    required this.dropDownMenuInput,
  });
}

class DropDownMenuResult extends MassaEvent {
  final String dropDownMenuResult;
  DropDownMenuResult({
    required this.dropDownMenuResult,
  });
}

class ShowFormula extends MassaEvent {
  final String formula;
  ShowFormula({
    required this.formula,
  });
}

enum MassaConversionType {
  // Kilogram
  kgToKg,
  kgToGram,
  kgToOunce,
  kgToPound,
  kgToMg,
  kgToTon,

  // Gram
  gramToKg,
  gramToGram,
  gramToOunce,
  gramToPound,
  gramToMg,
  gramToTon,

  // Milligram
  mgToKg,
  mgToGram,
  mgToOunce,
  mgToPound,
  mgToMg,
  mgToTon,

  // Ounce
  ounceToKg,
  ounceToGram,
  ounceToOunce,
  ounceToPound,
  ounceToMg,
  ounceToTon,

  // Pound
  poundToKg,
  poundToGram,
  poundToOunce,
  poundToPound,
  poundToMg,
  poundToTon,

  // Ton
  tonToKg,
  tonToGram,
  tonToOunce,
  tonToPound,
  tonToMg,
  tonToTon,
}

class MassaConversion extends MassaEvent {
  final double value;
  final MassaConversionType conversionType;
  MassaConversion({
    required this.value,
    required this.conversionType,
  });
}
