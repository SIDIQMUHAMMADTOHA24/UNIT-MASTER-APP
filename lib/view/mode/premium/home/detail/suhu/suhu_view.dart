import 'package:conversion_app/view/mode/premium/home/bloc/dark_mode_bloc.dart';
import 'package:conversion_app/view/mode/premium/home/detail/suhu/bloc/suhu_bloc.dart';
import 'package:conversion_app/view/mode/premium/home/detail/suhu/data/data_suhu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuhuView extends StatefulWidget {
  const SuhuView({super.key});

  @override
  State<SuhuView> createState() => _SuhuViewState();
}

class _SuhuViewState extends State<SuhuView> {
  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void _updateSize() {
    final textLength = inputController.text.length;
    context.read<SuhuBloc>().add(FontSize(size: textLength.toDouble()));
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
            resizeToAvoidBottomInset: false,
            backgroundColor:
                isDarkMode ? const Color(0xFF121212) : Colors.white,
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
                'Konversi Suhu',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black.withOpacity(0.8)),
              ),
            ),
            body: BlocBuilder<SuhuBloc, Map<String, dynamic>>(
              builder: (context, state) {
                final valueInput = state['dropDownMenuInput'];
                final valueResult = state['dropDownMenuResult'];
                resultController.text = state['resultValue'];
                final fontSize = state['fontSize'];
                final formula = state['formula'];
                // print(fontSize);
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
                      .read<SuhuBloc>()
                      .add(DropDownMenuInput(dropDownMenuInput: value ?? ''));
                  onLogic(context,
                      inputValue: value!,
                      inputResult: valueResult,
                      inputController: inputController);
                  showFormula(context,
                      inputValue: value, inputResult: valueResult);
                },
                dropdownMenuEntries: DataSuhu.listDataSuhu
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
                      .read<SuhuBloc>()
                      .add(DropDownMenuResult(dropDownMenuResult: value ?? ''));
                  onLogic(context,
                      inputValue: valueInput,
                      inputResult: value!,
                      inputController: inputController);
                  showFormula(context,
                      inputValue: valueInput, inputResult: value);
                },
                dropdownMenuEntries: DataSuhu.listDataSuhu
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

    if (inputValue == '°C' && inputResult == '°C') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.celsiusToCelsius));
    }
    if (inputValue == '°C' && inputResult == '°F') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.celsiusToFahrenheit));
    }
    if (inputValue == '°C' && inputResult == 'Kelvin') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.celsiusToKelvin));
    }

    if (inputValue == '°F' && inputResult == '°C') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.fahrenheitToCelsius));
    }
    if (inputValue == '°F' && inputResult == '°F') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.fahrenheitToFahrenheit));
    }
    if (inputValue == '°F' && inputResult == 'Kelvin') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.fahrenheitToKelvin));
    }

    if (inputValue == 'Kelvin' && inputResult == '°C') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.kelvinToCelsius));
    }
    if (inputValue == 'Kelvin' && inputResult == '°F') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.kelvinToFahrenheit));
    }
    if (inputValue == 'Kelvin' && inputResult == 'Kelvin') {
      context.read<SuhuBloc>().add(TemperatureConversion(
          value: inputValueAsDouble,
          conversionType: TemperatureConversionType.kelvinToKelvin));
    }
  }

  void showFormula(
    BuildContext context, {
    required String inputValue,
    required String inputResult,
  }) {
    if (inputValue == '°C' && inputResult == '°C') {
      context.read<SuhuBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == '°C' && inputResult == '°F') {
      context.read<SuhuBloc>().add(ShowFormula(formula: '(°C × 1.8) + 32'));
    }
    if (inputValue == '°C' && inputResult == 'Kelvin') {
      context.read<SuhuBloc>().add(ShowFormula(formula: '°C + 273,15'));
    }
    //
    if (inputValue == '°F' && inputResult == '°C') {
      context.read<SuhuBloc>().add(ShowFormula(formula: '(°F − 32) × 0.556'));
    }
    if (inputValue == '°F' && inputResult == '°F') {
      context.read<SuhuBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == '°F' && inputResult == 'Kelvin') {
      context
          .read<SuhuBloc>()
          .add(ShowFormula(formula: '(°F − 32) × 1.8 + 273,15 '));
    }
    //
    if (inputValue == 'Kelvin' && inputResult == '°C') {
      context.read<SuhuBloc>().add(ShowFormula(formula: 'K − 273,15'));
    }
    if (inputValue == 'Kelvin' && inputResult == '°F') {
      context
          .read<SuhuBloc>()
          .add(ShowFormula(formula: '(K − 273,15) × 1.8 + 32'));
    }
    if (inputValue == 'Kelvin' && inputResult == 'Kelvin') {
      context.read<SuhuBloc>().add(ShowFormula(formula: ''));
    }
  }
}
