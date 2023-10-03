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
// //Event For Logic Math
// class CmToMeter extends LongEvent {
//   final double cm;
//   CmToMeter({
//     required this.cm,
//   });
// }

// class CmToCm extends LongEvent {
//   final double cm;
//   CmToCm({
//     required this.cm,
//   });
// }

// class CmToMm extends LongEvent {
//   final double cm;
//   CmToMm({
//     required this.cm,
//   });
// }

// class CmToInch extends LongEvent {
//   final double cm;
//   CmToInch({
//     required this.cm,
//   });
// }

// class CmToKm extends LongEvent {
//   final double cm;
//   CmToKm({
//     required this.cm,
//   });
// }

// class MeterToMeter extends LongEvent {
//   final double m;
//   MeterToMeter({
//     required this.m,
//   });
// }

// class MeterToCm extends LongEvent {
//   final double m;
//   MeterToCm({
//     required this.m,
//   });
// }

// class MeterToMm extends LongEvent {
//   final double m;
//   MeterToMm({
//     required this.m,
//   });
// }

// class MeterToInch extends LongEvent {
//   final double m;
//   MeterToInch({
//     required this.m,
//   });
// }

// class MeterToKm extends LongEvent {
//   final double m;
//   MeterToKm({
//     required this.m,
//   });
// }

// class InchToInch extends LongEvent {
//   final double inch;
//   InchToInch({
//     required this.inch,
//   });
// }

// class InchToMeter extends LongEvent {
//   final double inch;
//   InchToMeter({
//     required this.inch,
//   });
// }

// class InchToCm extends LongEvent {
//   final double inch;
//   InchToCm({
//     required this.inch,
//   });
// }

// class InchToKm extends LongEvent {
//   final double inch;
//   InchToKm({
//     required this.inch,
//   });
// }

// class InchToMm extends LongEvent {
//   final double inch;
//   InchToMm({
//     required this.inch,
//   });
// }

// class MmToMm extends LongEvent {
//   final double mm;
//   MmToMm({
//     required this.mm,
//   });
// }

// class MmToCm extends LongEvent {
//   final double mm;
//   MmToCm({
//     required this.mm,
//   });
// }

// class MmToKm extends LongEvent {
//   final double mm;
//   MmToKm({
//     required this.mm,
//   });
// }

// class MmToMeter extends LongEvent {
//   final double mm;
//   MmToMeter({
//     required this.mm,
//   });
// }

// class MmToInch extends LongEvent {
//   final double mm;
//   MmToInch({
//     required this.mm,
//   });
// }

// class KmToKm extends LongEvent {
//   final double km;
//   KmToKm({
//     required this.km,
//   });
// }

// class KmToMm extends LongEvent {
//   final double km;
//   KmToMm({
//     required this.km,
//   });
// }

// class KmToCm extends LongEvent {
//   final double km;
//   KmToCm({
//     required this.km,
//   });
// }

// class KmToMeter extends LongEvent {
//   final double km;
//   KmToMeter({
//     required this.km,
//   });
// }

// class KmToInch extends LongEvent {
//   final double km;
//   KmToInch({
//     required this.km,
//   });
// }

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
