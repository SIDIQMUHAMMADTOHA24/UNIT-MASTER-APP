// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'long_bloc.dart';

@immutable
sealed class LongEvent {}

//Drop Down
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

//Logic Matematic

class ConvertSentiMeterToSentiMeter extends LongEvent {
  final double cm;
  ConvertSentiMeterToSentiMeter({
    required this.cm,
  });
}

class ConvertSentiMeterToMeter extends LongEvent {
  final double m;
  ConvertSentiMeterToMeter({
    required this.m,
  });
}

class ConvertSentiMeterToMiliMeter extends LongEvent {
  final double mm;
  ConvertSentiMeterToMiliMeter({
    required this.mm,
  });
}

class ConvertSentiMeterToKiloMeter extends LongEvent {
  final double km;
  ConvertSentiMeterToKiloMeter({
    required this.km,
  });
}

class ConvertSentiMeterToInch extends LongEvent {
  final double inch;
  ConvertSentiMeterToInch({
    required this.inch,
  });
}

class ConvertMeterToSentiMeter extends LongEvent {
  final double cm;
  ConvertMeterToSentiMeter({
    required this.cm,
  });
}

class ConvertMeterToMeter extends LongEvent {
  final double m;
  ConvertMeterToMeter({
    required this.m,
  });
}

class ConvertMeterToKiloMeter extends LongEvent {
  final double km;
  ConvertMeterToKiloMeter({
    required this.km,
  });
}

class ConvertMeterToMiliMeter extends LongEvent {
  final double mm;
  ConvertMeterToMiliMeter({
    required this.mm,
  });
}

class ConvertMeterToInch extends LongEvent {
  final double inch;
  ConvertMeterToInch({
    required this.inch,
  });
}

class ConvertKiloMeterToKiloMeter extends LongEvent {
  final double km;
  ConvertKiloMeterToKiloMeter({
    required this.km,
  });
}

class ConvertKiloMeterToMiliMeter extends LongEvent {
  final double mm;
  ConvertKiloMeterToMiliMeter({
    required this.mm,
  });
}

class ConvertKiloMeterToSentiMeter extends LongEvent {
  final double cm;
  ConvertKiloMeterToSentiMeter({
    required this.cm,
  });
}

class ConvertKiloMeterToInch extends LongEvent {
  final double inch;
  ConvertKiloMeterToInch({
    required this.inch,
  });
}

class ConvertKiloMeterToMeter extends LongEvent {
  final double m;
  ConvertKiloMeterToMeter({
    required this.m,
  });
}
