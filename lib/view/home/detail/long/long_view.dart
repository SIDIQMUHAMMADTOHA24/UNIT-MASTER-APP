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
            'Konversi Panjang',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.8)),
          ),
        ),
        body: BlocBuilder<LongBloc, Map<String, dynamic>>(
          builder: (context, state) {
            final valueInput = state['dropDownMenuInput'];
            final valueResult = state['dropDownMenuResult'];
            resultController.text = state['resultValue'];
            final fontSize = state['fontSize'];
            return Column(
              children: [
                //input
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
                Text(
                  state['formula'] ?? '',
                  style: const TextStyle(fontSize: 18),
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
                textStyle: TextStyle(fontSize: 40.sp, color: Colors.black),
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
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            DropdownMenu(
                controller: TextEditingController(text: valueResult),
                inputDecorationTheme:
                    const InputDecorationTheme(border: InputBorder.none),
                textStyle: TextStyle(
                    fontSize: 40.sp, color: Colors.black.withOpacity(0.5)),
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
    ////////////////////////////Cm/////////////////////

    if (inputValue == 'cm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(CmToMeter(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - m');
    }
    if (inputValue == 'cm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(CmToCm(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - cm');
    }
    if (inputValue == 'cm' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(CmToMm(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - mm');
    }
    if (inputValue == 'cm' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(CmToKm(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - km');
    }
    if (inputValue == 'cm' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(CmToInch(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - inch');
    }

    ////////////////////////////Meter/////////////////////

    if (inputValue == 'm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(MeterToMeter(m: double.tryParse(inputController.text) ?? 0));
      print('m - m');
    }
    if (inputValue == 'm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(MeterToCm(m: double.tryParse(inputController.text) ?? 0));
      print('m - cm');
    }
    if (inputValue == 'm' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(MeterToMm(m: double.tryParse(inputController.text) ?? 0));
      print('m - mm');
    }
    if (inputValue == 'm' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(MeterToKm(m: double.tryParse(inputController.text) ?? 0));
      print('m - km');
    }
    if (inputValue == 'm' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(MeterToInch(m: double.tryParse(inputController.text) ?? 0));
      print('m - inch');
    }

    ////////////////////////////Inch/////////////////////

    if (inputValue == 'inch' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(InchToInch(inch: double.tryParse(inputController.text) ?? 0));
      print('inch - inch');
    }
    if (inputValue == 'inch' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(InchToCm(inch: double.tryParse(inputController.text) ?? 0));
      print('inch - cm');
    }
    if (inputValue == 'inch' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(InchToMeter(inch: double.tryParse(inputController.text) ?? 0));
      print('inch - m');
    }
    if (inputValue == 'inch' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(InchToKm(inch: double.tryParse(inputController.text) ?? 0));
      print('inch - km');
    }
    if (inputValue == 'inch' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(InchToMm(inch: double.tryParse(inputController.text) ?? 0));
      print('inch - mm');
    }

    ////////////////////////////Mm/////////////////////

    if (inputValue == 'mm' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(MmToMm(mm: double.tryParse(inputController.text) ?? 0));
      print('mm - mm');
    }
    if (inputValue == 'mm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(MmToCm(mm: double.tryParse(inputController.text) ?? 0));
      print('mm - cm');
    }
    if (inputValue == 'mm' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(MmToKm(mm: double.tryParse(inputController.text) ?? 0));
      print('mm - km');
    }
    if (inputValue == 'mm' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(MmToInch(mm: double.tryParse(inputController.text) ?? 0));
      print('mm - inch');
    }
    if (inputValue == 'mm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(MmToMeter(mm: double.tryParse(inputController.text) ?? 0));
      print('mm - m');
    }

    ////////////////////////////Km/////////////////////

    if (inputValue == 'km' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(KmToKm(km: double.tryParse(inputController.text) ?? 0));
      print('km - km');
    }

    if (inputValue == 'km' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(KmToMeter(km: double.tryParse(inputController.text) ?? 0));
      print('km - m');
    }

    if (inputValue == 'km' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(KmToMm(km: double.tryParse(inputController.text) ?? 0));
      print('km - mm');
    }

    if (inputValue == 'km' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(KmToInch(km: double.tryParse(inputController.text) ?? 0));
      print('km - inch');
    }

    if (inputValue == 'km' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(KmToCm(km: double.tryParse(inputController.text) ?? 0));
      print('km - cm');
    }
  }

  void showFormula(
    BuildContext context, {
    required String inputValue,
    required String inputResult,
  }) {
    String initial = 'Formula :';
    if (inputValue == 'cm' && inputResult == 'cm') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'cm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 100'));
    }
    if (inputValue == 'cm' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 10'));
    }
    if (inputValue == 'cm' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 100.000'));
    }
    if (inputValue == 'cm' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 2.54'));
    }
    if (inputValue == 'm' && inputResult == 'm') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 100'));
    }
    if (inputValue == 'm' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 1000'));
    }
    if (inputValue == 'm' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 1000'));
    }
    if (inputValue == 'm' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 39.37'));
    }
    if (inputValue == 'mm' && inputResult == 'mm') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'mm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 10'));
    }
    if (inputValue == 'mm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 1000'));
    }
    if (inputValue == 'mm' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 25.4'));
    }
    if (inputValue == 'mm' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 1000000'));
    }
    if (inputValue == 'km' && inputResult == 'km') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'km' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 100000'));
    }
    if (inputValue == 'km' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 1000'));
    }
    if (inputValue == 'km' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 1000000'));
    }
    if (inputValue == 'km' && inputResult == 'inch') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 39370'));
    }
    if (inputValue == 'inch' && inputResult == 'inch') {
      context.read<LongBloc>().add(ShowFormula(formula: ''));
    }
    if (inputValue == 'inch' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 2.54'));
    }
    if (inputValue == 'inch' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 39.37'));
    }
    if (inputValue == 'inch' && inputResult == 'mm') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial kali dengan 25.4'));
    }
    if (inputValue == 'inch' && inputResult == 'km') {
      context
          .read<LongBloc>()
          .add(ShowFormula(formula: '$initial bagi dengan 0.0000254'));
    }
  }
}
