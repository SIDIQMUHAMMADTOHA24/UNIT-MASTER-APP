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

class CelsiusToFahrenheit extends SuhuEvent {
  final double c;
  CelsiusToFahrenheit({
    required this.c,
  });
}

class CelsiusToKelvin extends SuhuEvent {
  final double c;
  CelsiusToKelvin({
    required this.c,
  });
}

class CelsiusToCelsius extends SuhuEvent {
  final double c;
  CelsiusToCelsius({
    required this.c,
  });
}

class FahrenheitToCelsius extends SuhuEvent {
  final double f;
  FahrenheitToCelsius({
    required this.f,
  });
}

class FahrenheitToKelvin extends SuhuEvent {
  final double f;
  FahrenheitToKelvin({
    required this.f,
  });
}

class FahrenheitToFahrenheit extends SuhuEvent {
  final double f;
  FahrenheitToFahrenheit({
    required this.f,
  });
}


class KelvinToKelvin extends SuhuEvent {
  final double k;
  KelvinToKelvin({
    required this.k,
  });
}

class KelvinToCelsius extends SuhuEvent {
  final double k;
  KelvinToCelsius({
    required this.k,
  });
}

class KelvinToFahrenheit extends SuhuEvent {
  final double k;
  KelvinToFahrenheit({
    required this.k,
  });
}


class ShowFormula extends SuhuEvent {
  final String formula;
  ShowFormula({
    required this.formula,
  });
}
