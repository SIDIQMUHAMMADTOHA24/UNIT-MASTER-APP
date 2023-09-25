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

class CmToMeter extends LongEvent {
  final double cm;
  CmToMeter({
    required this.cm,
  });
}

class CmToCm extends LongEvent {
  final double cm;
  CmToCm({
    required this.cm,
  });
}

class MeterToMeter extends LongEvent {
  final double m;
  MeterToMeter({
    required this.m,
  });
}

class MeterToCm extends LongEvent {
  final double m;
  MeterToCm({
    required this.m,
  });
}
