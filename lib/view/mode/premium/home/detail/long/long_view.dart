import 'package:conversion_app/view/mode/premium/home/bloc/dark_mode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/long_bloc.dart';
import 'data/data_long.dart';

class LongView extends StatefulWidget {
  const LongView({super.key});

  @override
  State<LongView> createState() => _LongViewState();
}

class _LongViewState extends State<LongView> {
  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void _updateSize() {
    final textLength = inputController.text.length;
    context.read<LongBloc>().add(FontSize(size: textLength.toDouble()));
  }

  @override
  void initState() {
    inputController.addListener(_updateSize);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    inputController.dispose();
    resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, bool>(
      builder: (context, state) {
        final isDarkMode = context.read<DarkModeBloc>().state;
        return Scaffold(
            backgroundColor:
                isDarkMode ? const Color(0xFF121212) : Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              toolbarHeight: 60.h,
              bottom: const PreferredSize(
                  preferredSize: Size(0, 10),
                  child: Divider(
                    color: Colors.grey,
                  )),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 30,
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black.withOpacity(0.7),
                  )),
              elevation: 0,
              backgroundColor:
                  isDarkMode ? const Color(0xFF121212) : Colors.white,
              title: Text(
                'Konversi Panjang',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black.withOpacity(0.8)),
              ),
            ),
            body: BlocBuilder<LongBloc, Map<String, dynamic>>(
              builder: (context, state) {
                final valueInput = state['dropDownMenuInput'];
                final valueResult = state['dropDownMenuResult'];
                resultController.text = state['resultValue'];
                final fontSize = state['fontSize'];
                final formula = state['formula'];
                return Column(
                  children: [
                    //input
                    inputWidget(
                        context: context,
                        valueInput: valueInput,
                        valueResult: valueResult,
                        fontSize: fontSize,
                        isDarkMode: isDarkMode),

                    //output
                    resultWidget(
                        context: context,
                        valueInput: valueInput,
                        valueResult: valueResult,
                        fontSize: fontSize,
                        isDarkMode: isDarkMode),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (formula.isNotEmpty)
                            ? Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.amber),
                                child: const Center(
                                    child: Text('Formula :',
                                        style: TextStyle(fontSize: 18))),
                              )
                            : Container(),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          formula ?? '',
                          style: TextStyle(
                              fontSize: 18,
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                      ],
                    )
                  ],
                );
              },
            ));
      },
    );
  }

  Widget inputWidget(
      {required BuildContext context,
      required String valueInput,
      required String valueResult,
      required double fontSize,
      required bool isDarkMode}) {
    return Container(
        margin: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  enabled: true,
                  controller: inputController,
                  maxLength: 11,
                  autofocus: true,
                  style: TextStyle(
                      fontSize: fontSize.sp,
                      color: isDarkMode ? Colors.white : Colors.black),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none, counterText: ''),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    onLogic(context,
                        inputValue: valueInput,
                        inputResult: valueResult,
                        inputController: inputController);
                  }),
            ),
            DropdownMenu(
                controller: TextEditingController(text: valueInput),
                inputDecorationTheme:
                    const InputDecorationTheme(border: InputBorder.none),
                textStyle: TextStyle(
                    fontSize: 35.sp,
                    color: isDarkMode ? Colors.white : Colors.black),
                trailingIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                onSelected: (value) {
                  context
                      .read<LongBloc>()
                      .add(DropDownMenuInput(dropDownMenuInput: value ?? ''));
                  onLogic(context,
                      inputValue: value!,
                      inputResult: valueResult,
                      inputController: inputController);
                  showFormula(context,
                      inputValue: value, inputResult: valueResult);
                },
                dropdownMenuEntries: DataLong.listDataLong
                    .map(
                      (e) => DropdownMenuEntry(
                          value: e,
                          label: e,
                          style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(fontSize: 30.sp)))),
                    )
                    .toList()),
            const SizedBox(
              width: 10,
            )
          ],
        ));
  }

  Widget resultWidget(
      {required BuildContext context,
      required String valueInput,
      required String valueResult,
      required double fontSize,
      required bool isDarkMode}) {
    return Container(
        margin: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                enabled: false,
                controller: resultController,
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                maxLength: 11,
                decoration: const InputDecoration(
                    border: InputBorder.none, counterText: ''),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize.sp,
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black),
              ),
            ),
            DropdownMenu(
                controller: TextEditingController(text: valueResult),
                inputDecorationTheme:
                    const InputDecorationTheme(border: InputBorder.none),
                textStyle: TextStyle(
                    fontSize: 35.sp,
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black.withOpacity(0.5)),
                trailingIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                onSelected: (value) {
                  context
                      .read<LongBloc>()
                      .add(DropDownMenuResult(dropDownMenuResult: value ?? ''));
                  onLogic(context,
                      inputValue: valueInput,
                      inputResult: value!,
                      inputController: inputController);
                  showFormula(context,
                      inputValue: valueInput, inputResult: value);
                },
                dropdownMenuEntries: DataLong.listDataLong
                    .map(
                      (e) => DropdownMenuEntry(
                          value: e,
                          label: e,
                          style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(fontSize: 30.sp)))),
                    )
                    .toList()),
            const SizedBox(
              width: 10,
            )
          ],
        ));
  }

  void onLogic(BuildContext context,
      {required String inputValue,
      required String inputResult,
      required TextEditingController inputController}) {
    double inputValueAsDouble = double.tryParse(inputController.text) ?? 0;

    if (inputValue == 'cm' && inputResult == 'm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.cmToMeter));
    }
    if (inputValue == 'cm' && inputResult == 'cm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.cmToCm));
    }
    if (inputValue == 'cm' && inputResult == 'mm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.cmToMm));
    }
    if (inputValue == 'cm' && inputResult == 'km') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.cmToKm));
    }
    if (inputValue == 'cm' && inputResult == 'inch') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.cmToInch));
    }

    ////////////////////////////Meter/////////////////////

    if (inputValue == 'm' && inputResult == 'm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.meterToMeter));
    }
    if (inputValue == 'm' && inputResult == 'cm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.meterToCm));
    }
    if (inputValue == 'm' && inputResult == 'mm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.meterToMm));
    }
    if (inputValue == 'm' && inputResult == 'km') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.meterToKm));
    }
    if (inputValue == 'm' && inputResult == 'inch') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.meterToInch));
    }

    ////////////////////////////Inch/////////////////////

    if (inputValue == 'inch' && inputResult == 'm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.inchToMeter));
    }
    if (inputValue == 'inch' && inputResult == 'cm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.inchToCm));
    }
    if (inputValue == 'inch' && inputResult == 'mm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.inchToMm));
    }
    if (inputValue == 'inch' && inputResult == 'km') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.inchToKm));
    }
    if (inputValue == 'inch' && inputResult == 'inch') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.inchToInch));
    }

    ////////////////////////////Mm/////////////////////

    if (inputValue == 'mm' && inputResult == 'mm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.mmToMm));
    }
    if (inputValue == 'mm' && inputResult == 'cm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.mmToCm));
    }
    if (inputValue == 'mm' && inputResult == 'km') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.mmToKm));
    }
    if (inputValue == 'mm' && inputResult == 'inch') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.mmToInch));
    }
    if (inputValue == 'mm' && inputResult == 'm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.mmToMeter));
    }

    ////////////////////////////Km/////////////////////

    if (inputValue == 'km' && inputResult == 'km') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.kmToKm));
    }

    if (inputValue == 'km' && inputResult == 'm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.kmToMeter));
    }

    if (inputValue == 'km' && inputResult == 'mm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.kmToMm));
    }

    if (inputValue == 'km' && inputResult == 'inch') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.kmToInch));
    }

    if (inputValue == 'km' && inputResult == 'cm') {
      context.read<LongBloc>().add(LengthConversion(
          value: inputValueAsDouble,
          conversionType: LengthConversionType.kmToCm));
    }
  }

  void showFormula(
    BuildContext context, {
    required String inputValue,
    required String inputResult,
  }) {
    if (inputValue == 'cm' && inputResult == 'cm') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'cm' && inputResult == 'm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 100'));
    }
    if (inputValue == 'cm' && inputResult == 'mm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 10'));
    }
    if (inputValue == 'cm' && inputResult == 'km') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 100.000'));
    }
    if (inputValue == 'cm' && inputResult == 'inch') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 2.54'));
    }
    if (inputValue == 'm' && inputResult == 'm') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'm' && inputResult == 'cm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 100'));
    }
    if (inputValue == 'm' && inputResult == 'mm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 1000'));
    }
    if (inputValue == 'm' && inputResult == 'km') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 1000'));
    }
    if (inputValue == 'm' && inputResult == 'inch') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 39.37'));
    }
    if (inputValue == 'mm' && inputResult == 'mm') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'mm' && inputResult == 'cm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 10'));
    }
    if (inputValue == 'mm' && inputResult == 'm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 1000'));
    }
    if (inputValue == 'mm' && inputResult == 'inch') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 25.4'));
    }
    if (inputValue == 'mm' && inputResult == 'km') {
      context.read<LongBloc>().add(ShowFormula(formula: 'bagi dengan 1000000'));
    }
    if (inputValue == 'km' && inputResult == 'km') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'km' && inputResult == 'cm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 100000'));
    }
    if (inputValue == 'km' && inputResult == 'm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 1000'));
    }
    if (inputValue == 'km' && inputResult == 'mm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 1000000'));
    }
    if (inputValue == 'km' && inputResult == 'inch') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 39370'));
    }
    if (inputValue == 'inch' && inputResult == 'inch') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'inch' && inputResult == 'cm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 2.54'));
    }
    if (inputValue == 'inch' && inputResult == 'm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 39.37'));
    }
    if (inputValue == 'inch' && inputResult == 'mm') {
      context.read<LongBloc>().add(ShowFormula(formula: 'kali dengan 25.4'));
    }
    if (inputValue == 'inch' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: 'bagi dengan 0.0000254'));
    }
  }
}
