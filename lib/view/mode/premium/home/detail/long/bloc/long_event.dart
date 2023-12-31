// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'long_bloc.dart';

@immutable
sealed class LongEvent {}

//event for fontSize
class FontSize extends LongEvent {
  final double size;
  FontSize({
    required this.size,
  });
}

//Event for DropDownMenu
class DropDownMenuInput extends LongEvent {
  final String dropDownMenuInput;
  DropDownMenuInput({
    required this.dropDownMenuInput,
  });
}

class DropDownMenuResult extends LongEvent {
  final String dropDownMenuResult;
  DropDownMenuResult({
    required this.dropDownMenuResult,
  });
}

class ShowFormula extends LongEvent {
  final String formula;
  ShowFormula({
    required this.formula,
  });
}

enum LengthConversionType {
  cmToMeter,
  cmToCm,
  cmToMm,
  cmToInch,
  cmToKm,
  meterToMeter,
  meterToCm,
  meterToMm,
  meterToInch,
  meterToKm,
  inchToInch,
  inchToMeter,
  inchToCm,
  inchToKm,
  inchToMm,
  mmToMm,
  mmToCm,
  mmToKm,
  mmToMeter,
  mmToInch,
  kmToKm,
  kmToMm,
  kmToCm,
  kmToMeter,
  kmToInch,
}

class LengthConversion extends LongEvent {
  final double value;
  final LengthConversionType conversionType;
  LengthConversion({
    required this.value,
    required this.conversionType,
  });
}
