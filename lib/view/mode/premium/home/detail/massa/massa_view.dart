import 'package:conversion_app/view/mode/premium/home/detail/massa/bloc/massa_bloc.dart';
import 'package:conversion_app/view/mode/premium/home/detail/massa/data/data_massa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MassaView extends StatefulWidget {
  const MassaView({super.key});

  @override
  State<MassaView> createState() => _MassaViewState();
}

class _MassaViewState extends State<MassaView> {
  TextEditingController inputController = TextEditingController();

  TextEditingController resultController = TextEditingController();
  void _updateSize() {
    final textLength = inputController.text.length;
    context.read<MassaBloc>().add(FontSize(size: textLength.toDouble()));
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
    return Scaffold(
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
                color: Colors.black.withOpacity(0.7),
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Konversi Massa',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.8)),
          ),
        ),
        body: BlocBuilder<MassaBloc, Map<String, dynamic>>(
          builder: (context, state) {
            final valueInput = state['dropDownMenuInput'];
            final valueResult = state['dropDownMenuResult'];
            resultController.text = state['resultValue'];
            final fontSize = state['fontSize'];
            final formula = state['formula'];
            print(fontSize.toString());
            return Column(
              children: [
                // input
                inputWidget(
                    context: context,
                    valueInput: valueInput,
                    valueResult: valueResult,
                    fontSize: fontSize),

                //output
                resultWidget(
                    context: context,
                    valueInput: valueInput,
                    valueResult: valueResult,
                    fontSize: fontSize),
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
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            );
          },
        ));
  }

  Widget inputWidget(
      {required BuildContext context,
      required String valueInput,
      required String valueResult,
      required double fontSize}) {
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
                  style: TextStyle(fontSize: fontSize.sp),
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
                textStyle: TextStyle(fontSize: 35.sp, color: Colors.black),
                trailingIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                onSelected: (value) {
                  context
                      .read<MassaBloc>()
                      .add(DropDownMenuInput(dropDownMenuInput: value ?? ''));
                  onLogic(context,
                      inputValue: value!,
                      inputResult: valueResult,
                      inputController: inputController);
                  showFormula(context,
                      inputValue: value, inputResult: valueResult);
                },
                dropdownMenuEntries: DataMassa.listDataMassa
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
      required double fontSize}) {
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
                style: TextStyle(fontSize: fontSize.sp),
              ),
            ),
            DropdownMenu(
                controller: TextEditingController(text: valueResult),
                inputDecorationTheme:
                    const InputDecorationTheme(border: InputBorder.none),
                textStyle: TextStyle(
                    fontSize: 35.sp, color: Colors.black.withOpacity(0.5)),
                trailingIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                onSelected: (value) {
                  context
                      .read<MassaBloc>()
                      .add(DropDownMenuResult(dropDownMenuResult: value ?? ''));
                  onLogic(context,
                      inputValue: valueInput,
                      inputResult: value!,
                      inputController: inputController);
                  showFormula(context,
                      inputValue: valueInput, inputResult: value);
                },
                dropdownMenuEntries: DataMassa.listDataMassa
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
///////////////////////////////KG///////////////////////////////
    double inputValueAsDouble = double.tryParse(inputController.text) ?? 0;
    if (inputValue == 'kg' && inputResult == 'gram') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.kgToGram));
    }
    if (inputValue == 'kg' && inputResult == 'kg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.kgToKg));
    }
    if (inputValue == 'kg' && inputResult == 'ton') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.kgToTon));
    }
    if (inputValue == 'kg' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.kgToOunce));
    }
    if (inputValue == 'kg' && inputResult == 'pound') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.kgToPound));
    }
    if (inputValue == 'kg' && inputResult == 'mg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.kgToMg));
    }

///////////////////////////////GRAM///////////////////////////////
    if (inputValue == 'gram' && inputResult == 'kg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.gramToKg));
      print('gram - kg');
    }
    if (inputValue == 'gram' && inputResult == 'gram') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.gramToGram));
    }
    if (inputValue == 'gram' && inputResult == 'ton') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.gramToTon));
    }
    if (inputValue == 'gram' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.gramToOunce));
    }
    if (inputValue == 'gram' && inputResult == 'pound') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.gramToPound));
    }
    if (inputValue == 'gram' && inputResult == 'mg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.gramToMg));
    }

    if (inputValue == 'ton' && inputResult == 'kg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.tonToKg));
      print('ton - kg');
    }
    if (inputValue == 'ton' && inputResult == 'gram') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.tonToGram));
    }
    if (inputValue == 'ton' && inputResult == 'ton') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.tonToTon));
    }
    if (inputValue == 'ton' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.tonToOunce));
    }
    if (inputValue == 'ton' && inputResult == 'pound') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.tonToPound));
    }
    if (inputValue == 'ton' && inputResult == 'mg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.tonToMg));
    }

    if (inputValue == 'ounce' && inputResult == 'kg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.ounceToKg));
    }
    if (inputValue == 'ounce' && inputResult == 'gram') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.ounceToGram));
    }
    if (inputValue == 'ounce' && inputResult == 'ton') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.ounceToTon));
    }
    if (inputValue == 'ounce' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.ounceToOunce));
    }
    if (inputValue == 'ounce' && inputResult == 'pound') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.ounceToPound));
    }
    if (inputValue == 'ounce' && inputResult == 'mg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.ounceToMg));
    }

    if (inputValue == 'pound' && inputResult == 'kg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.poundToKg));
    }
    if (inputValue == 'pound' && inputResult == 'gram') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.poundToGram));
    }
    if (inputValue == 'pound' && inputResult == 'ton') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.poundToTon));
    }
    if (inputValue == 'pound' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.poundToOunce));
    }
    if (inputValue == 'pound' && inputResult == 'pound') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.poundToPound));
    }
    if (inputValue == 'pound' && inputResult == 'mg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.poundToMg));
    }

    if (inputValue == 'mg' && inputResult == 'kg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.mgToKg));
    }
    if (inputValue == 'mg' && inputResult == 'gram') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.mgToGram));
    }
    if (inputValue == 'mg' && inputResult == 'ton') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.mgToTon));
    }
    if (inputValue == 'mg' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.mgToOunce));
    }
    if (inputValue == 'mg' && inputResult == 'pound') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.mgToPound));
    }
    if (inputValue == 'mg' && inputResult == 'mg') {
      context.read<MassaBloc>().add(MassaConversion(
          value: inputValueAsDouble,
          conversionType: MassaConversionType.mgToMg));
    }
  }

  void showFormula(
    BuildContext context, {
    required String inputValue,
    required String inputResult,
  }) {
    if (inputValue == 'kg' && inputResult == 'kg') {
      context.read<MassaBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'kg' && inputResult == 'ton') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 1000'));
    }
    if (inputValue == 'kg' && inputResult == 'gram') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'kali dengan 1000'));
    }
    if (inputValue == 'kg' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'kali dengan 35.274'));
    }
    if (inputValue == 'kg' && inputResult == 'pound') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 2.20462'));
    }
    if (inputValue == 'kg' && inputResult == 'mg') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 1000000 '));
    }
    //
    if (inputValue == 'gram' && inputResult == 'kg') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 1000'));
    }
    if (inputValue == 'gram' && inputResult == 'ton') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'bagi dengan 1000000'));
    }
    if (inputValue == 'gram' && inputResult == 'gram') {
      context.read<MassaBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'gram' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 28.35'));
    }
    if (inputValue == 'gram' && inputResult == 'pound') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 453.6'));
    }
    if (inputValue == 'gram' && inputResult == 'mg') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'kali dengan 1000'));
    }
    //
    if (inputValue == 'ton' && inputResult == 'kg') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 1000'));
    }
    if (inputValue == 'ton' && inputResult == 'ton') {
      context.read<MassaBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'ton' && inputResult == 'gram') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 1000000'));
    }
    if (inputValue == 'ton' && inputResult == 'ounce') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 35273961'));
    }
    if (inputValue == 'ton' && inputResult == 'pound') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 2204.62'));
    }
    if (inputValue == 'ton' && inputResult == 'mg') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 1000000000'));
    }
    //
    if (inputValue == 'mg' && inputResult == 'kg') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'bagi dengan 1000000'));
    }
    if (inputValue == 'mg' && inputResult == 'ton') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 1000000'));
    }
    if (inputValue == 'mg' && inputResult == 'gram') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 1000'));
    }
    if (inputValue == 'mg' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 28350'));
    }
    if (inputValue == 'mg' && inputResult == 'pound') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 453600'));
    }
    if (inputValue == 'mg' && inputResult == 'mg') {
      context.read<MassaBloc>().add(ShowFormula(formula: ''));
    }
    //
    if (inputValue == 'ounce' && inputResult == 'kg') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 0.0283495'));
    }
    if (inputValue == 'ounce' && inputResult == 'ton') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 0.0000283495'));
    }
    if (inputValue == 'ounce' && inputResult == 'gram') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 28.3495'));
    }
    if (inputValue == 'ounce' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'ounce' && inputResult == 'pound') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'kali dengan 0.0625'));
    }
    if (inputValue == 'ounce' && inputResult == 'mg') {
      context.read<MassaBloc>().add(ShowFormula(formula: '28.3495'));
    }
    //
    if (inputValue == 'pound' && inputResult == 'kg') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'bagi dengan 2.205'));
    }
    if (inputValue == 'pound' && inputResult == 'ton') {
      context
          .read<MassaBloc>()
          .add(ShowFormula(formula: 'kali dengan 0.000453592'));
    }
    if (inputValue == 'pound' && inputResult == 'gram') {
      context.read<MassaBloc>().add(ShowFormula(formula: '453.6'));
    }
    if (inputValue == 'pound' && inputResult == 'ounce') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'kali dengan 16'));
    }
    if (inputValue == 'pound' && inputResult == 'pound') {
      context.read<MassaBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'pound' && inputResult == 'mg') {
      context.read<MassaBloc>().add(ShowFormula(formula: 'kali dengan 453600'));
    }
  }
}
