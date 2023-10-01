// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'suhu_bloc.dart';

@immutable
sealed class SuhuEvent {}

//Event for resize
class FontSize extends SuhuEvent {
  final double size;
  FontSize({
    required this.size,
  });
}

//Event for DropDownMenu
class DropDownMenuInput extends SuhuEvent {
  final String dropDownMenuInput;
  DropDownMenuInput({
    required this.dropDownMenuInput,
  });
}

class DropDownMenuResult extends SuhuEvent {
  final String dropDownMenuResult;
  DropDownMenuResult({
    required this.dropDownMenuResult,
  });
}

class ShowFormula extends SuhuEvent {
  final String formula;
  ShowFormula({
    required this.formula,
  });
}

enum TemperatureConversionType {
  celsiusToFahrenheit,
  celsiusToKelvin,
  celsiusToCelsius,
  fahrenheitToCelsius,
  fahrenheitToKelvin,
  fahrenheitToFahrenheit,
  kelvinToKelvin,
  kelvinToCelsius,
  kelvinToFahrenheit,
}

class TemperatureConversion extends SuhuEvent {
  final double value;
  final TemperatureConversionType conversionType;

  TemperatureConversion({required this.value, required this.conversionType});
}
