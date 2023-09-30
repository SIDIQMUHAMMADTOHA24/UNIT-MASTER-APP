// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'massa_bloc.dart';

@immutable
sealed class MassaEvent {}

//Event for resize
class FontSize extends MassaBloc {
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

//Event for Loic
////////////////////////////Kg//////////////////////////////
class KgToGram extends MassaEvent {
  final double kg;
  KgToGram({
    required this.kg,
  });
}

class KgToKg extends MassaEvent {
  final double kg;
  KgToKg({
    required this.kg,
  });
}

class KgToOunce extends MassaEvent {
  final double kg;
  KgToOunce({
    required this.kg,
  });
}

class KgToPound extends MassaEvent {
  final double kg;
  KgToPound({
    required this.kg,
  });
}

class KgToMg extends MassaEvent {
  final double kg;
  KgToMg({
    required this.kg,
  });
}

class KgToKw extends MassaEvent {
  final double kg;
  KgToKw({
    required this.kg,
  });
}

class KgToTon extends MassaEvent {
  final double kg;
  KgToTon({
    required this.kg,
  });
}

////////////////////////////Gram//////////////////////////////
class GramToKg extends MassaEvent {
  final double gram;
  GramToKg({
    required this.gram,
  });
}

class GramToGram extends MassaEvent {
  final double gram;
  GramToGram({
    required this.gram,
  });
}

class GramToOunce extends MassaEvent {
  final double gram;
  GramToOunce({
    required this.gram,
  });
}

class GramToMg extends MassaEvent {
  final double gram;
  GramToMg({
    required this.gram,
  });
}

class GramToPound extends MassaEvent {
  final double gram;
  GramToPound({
    required this.gram,
  });
}

class GramToKw extends MassaEvent {
  final double gram;
  GramToKw({
    required this.gram,
  });
}

class GramToTon extends MassaEvent {
  final double gram;
  GramToTon({
    required this.gram,
  });
}

////////////////////////////Mg//////////////////////////////
class MgToMg extends MassaEvent {
  final double mg;
  MgToMg({
    required this.mg,
  });
}

class MgToKg extends MassaEvent {
  final double mg;
  MgToKg({
    required this.mg,
  });
}

class MgToGram extends MassaEvent {
  final double mg;
  MgToGram({
    required this.mg,
  });
}

class MgToKw extends MassaEvent {
  final double mg;
  MgToKw({
    required this.mg,
  });
}

class MgToPound extends MassaEvent {
  final double mg;
  MgToPound({
    required this.mg,
  });
}

class MgToOunce extends MassaEvent {
  final double mg;
  MgToOunce({
    required this.mg,
  });
}

class MgToTon extends MassaEvent {
  final double mg;
  MgToTon({
    required this.mg,
  });
}

////////////////////////////Ounce//////////////////////////////
class OunceToKg extends MassaEvent {
  final double ounce;
  OunceToKg({
    required this.ounce,
  });
}

class OunceToGram extends MassaEvent {
  final double ounce;
  OunceToGram({
    required this.ounce,
  });
}

class OunceToKw extends MassaEvent {
  final double ounce;
  OunceToKw({
    required this.ounce,
  });
}

class OunceToPound extends MassaEvent {
  final double ounce;
  OunceToPound({
    required this.ounce,
  });
}

class OunceToTon extends MassaEvent {
  final double ounce;
  OunceToTon({
    required this.ounce,
  });
}

class OunceToMg extends MassaEvent {
  final double ounce;
  OunceToMg({
    required this.ounce,
  });
}

class OunceToOunce extends MassaEvent {
  final double ounce;
  OunceToOunce({
    required this.ounce,
  });
}

////////////////////////////Pound//////////////////////////////

class PoundToKg extends MassaEvent {
  final double pound;
  PoundToKg({
    required this.pound,
  });
}

class PoundToPound extends MassaEvent {
  final double pound;
  PoundToPound({
    required this.pound,
  });
}

class PoundToGram extends MassaEvent {
  final double pound;
  PoundToGram({
    required this.pound,
  });
}

class PoundToKw extends MassaEvent {
  final double pound;
  PoundToKw({
    required this.pound,
  });
}

class PoundToTon extends MassaEvent {
  final double pound;
  PoundToTon({
    required this.pound,
  });
}

class PoundToMg extends MassaEvent {
  final double pound;
  PoundToMg({
    required this.pound,
  });
}

class PoundToOunce extends MassaEvent {
  final double pound;
  PoundToOunce({
    required this.pound,
  });
}

////////////////////////////Kw//////////////////////////////
class KwToKw extends MassaEvent {
  final double kw;
  KwToKw({
    required this.kw,
  });
}

class KwToKg extends MassaEvent {
  final double kw;
  KwToKg({
    required this.kw,
  });
}

class KwToGram extends MassaEvent {
  final double kw;
  KwToGram({
    required this.kw,
  });
}

class KwToTon extends MassaEvent {
  final double kw;
  KwToTon({
    required this.kw,
  });
}

class KwToPound extends MassaEvent {
  final double kw;
  KwToPound({
    required this.kw,
  });
}

class KwToMg extends MassaEvent {
  final double kw;
  KwToMg({
    required this.kw,
  });
}

class KwToOunce extends MassaEvent {
  final double kw;
  KwToOunce({
    required this.kw,
  });
}

////////////////////////////Ton//////////////////////////////


class TonToKg extends MassaEvent {
  final double ton;
  TonToKg({
    required this.ton,
  });
}

class TonToGram extends MassaEvent {
  final double ton;
  TonToGram({
    required this.ton,
  });
}

class TonToKw extends MassaEvent {
  final double ton;
  TonToKw({
    required this.ton,
  });
}

class TonToOunce extends MassaEvent {
  final double ton;
  TonToOunce({
    required this.ton,
  });
}



class TonToPound extends MassaEvent {
  final double ton;
  TonToPound({
    required this.ton,
  });
}

class TonToTon extends MassaEvent {
  final double ton;
  TonToTon({
    required this.ton,
  });
}
