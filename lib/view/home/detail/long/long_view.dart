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
  TextEditingController resultController = TextEditingController();
  TextEditingController inputController = TextEditingController(text: '0');

  @override
  void dispose() {
    super.dispose();
    resultController.dispose();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: BlocConsumer<LongBloc, Map<String, dynamic>>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                inputTextFiled(context, state, inputController),
                resaultTextFiled(
                    context: context,
                    state: state,
                    resultController: resultController,
                    inputController: inputController),
              ],
            );
          },
        ));
  }
}

Widget inputTextFiled(BuildContext context, Map<String, dynamic> state,
    TextEditingController controller) {
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
                autofocus: true,
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.sp),
                onChanged: (value) {
                  // logicMath(
                  //     context: context,
                  //     state: state,
                  //     inputController: controller);
                }),
          ),
          DropdownMenu(
              controller:
                  TextEditingController(text: state['dropDownMenuInput']),
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
                    .add(DropDownMenuInput(dropDownMenuInput: value!));
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

Widget resaultTextFiled(
    {required BuildContext context,
    required Map<String, dynamic> state,
    required TextEditingController resultController,
    required TextEditingController inputController}) {
  resultController.text = state['resultValue'].toString();
  return Container(
      margin: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: resultController,
              enabled: false,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.sp),
            ),
          ),
          DropdownMenu(
              controller:
                  TextEditingController(text: state['dropDownMenuResult']),
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
                    .add(DropDownMenuResult(dropDownMenuResult: value!));
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

void logicMath({
  required BuildContext context,
  required Map<String, dynamic> state,
  required TextEditingController inputController,
}) {
  //cm => m
  if (state['dropDownMenuInput'] == 'cm' &&
      state['dropDownMenuResult'] == 'm') {
    context.read<LongBloc>().add(ConvertSentiMeterToMeter(
        m: double.tryParse(inputController.text) ?? 0));
  }
  //cm => cm
  if (state['dropDownMenuInput'] == 'cm' &&
      state['dropDownMenuResult'] == 'cm') {
    context.read<LongBloc>().add(ConvertSentiMeterToSentiMeter(
        cm: double.tryParse(inputController.text) ?? 0));
  }

  //cm => mm
  if (state['dropDownMenuInput'] == 'cm' &&
      state['dropDownMenuResult'] == 'mm') {
    context.read<LongBloc>().add(ConvertSentiMeterToMiliMeter(
        mm: double.tryParse(inputController.text) ?? 0));
  }

  //cm => km
  if (state['dropDownMenuInput'] == 'cm' &&
      state['dropDownMenuResult'] == 'km') {
    context.read<LongBloc>().add(ConvertSentiMeterToKiloMeter(
        km: double.tryParse(inputController.text) ?? 0));
  }
  //cm => inch
  if (state['dropDownMenuInput'] == 'cm' &&
      state['dropDownMenuResult'] == 'inch') {
    context.read<LongBloc>().add(ConvertSentiMeterToInch(
        inch: double.tryParse(inputController.text) ?? 0));
  }

  //m => m
  if (state['dropDownMenuInput'] == 'm' && state['dropDownMenuResult'] == 'm') {
    context.read<LongBloc>().add(
        ConvertMeterToMeter(m: double.tryParse(inputController.text) ?? 0));

    //m => cm
    if (state['dropDownMenuInput'] == 'm' &&
        state['dropDownMenuResult'] == 'cm') {
      context.read<LongBloc>().add(ConvertMeterToSentiMeter(
          cm: double.tryParse(inputController.text) ?? 0));
    }

    //m => km
    if (state['dropDownMenuInput'] == 'm' &&
        state['dropDownMenuResult'] == 'km') {
      context.read<LongBloc>().add(ConvertMeterToKiloMeter(
          km: double.tryParse(inputController.text) ?? 0));
    }

    //m => mm
    if (state['dropDownMenuInput'] == 'm' &&
        state['dropDownMenuResult'] == 'mm') {
      context.read<LongBloc>().add(ConvertMeterToMiliMeter(
          mm: double.tryParse(inputController.text) ?? 0));
    }

    //m => inch
    if (state['dropDownMenuInput'] == 'm' &&
        state['dropDownMenuResult'] == 'inch') {
      context.read<LongBloc>().add(
          ConvertMeterToInch(inch: double.tryParse(inputController.text) ?? 0));
    }

    //km => km
    if (state['dropDownMenuInput'] == 'km' &&
        state['dropDownMenuResult'] == 'km') {
      context.read<LongBloc>().add(ConvertKiloMeterToKiloMeter(
          km: double.tryParse(inputController.text) ?? 0));
    }

    //km => mm
    if (state['dropDownMenuInput'] == 'km' &&
        state['dropDownMenuResult'] == 'mm') {
      context.read<LongBloc>().add(ConvertKiloMeterToMiliMeter(
          mm: double.tryParse(inputController.text) ?? 0));
    }

    //km => cm
    if (state['dropDownMenuInput'] == 'km' &&
        state['dropDownMenuResult'] == 'cm') {
      context.read<LongBloc>().add(ConvertKiloMeterToSentiMeter(
          cm: double.tryParse(inputController.text) ?? 0));
    }

    //km => inch
    if (state['dropDownMenuInput'] == 'km' &&
        state['dropDownMenuResult'] == 'inch') {
      context.read<LongBloc>().add(ConvertKiloMeterToInch(
          inch: double.tryParse(inputController.text) ?? 0));
    }

    //km => m
    if (state['dropDownMenuInput'] == 'km' &&
        state['dropDownMenuResult'] == 'm') {
      context.read<LongBloc>().add(ConvertKiloMeterToMeter(
          m: double.tryParse(inputController.text) ?? 0));
    }
  }
}
