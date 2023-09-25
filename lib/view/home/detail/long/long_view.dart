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
        body: BlocBuilder<LongBloc, Map<String, dynamic>>(
          builder: (context, state) {
            final valueInput = state['dropDownMenuInput'];
            final valueResult = state['dropDownMenuResult'];
            resultController.text = state['resultValue'];
            return Column(
              children: [
                //input
                inputWidget(context, valueInput, valueResult),
                //output
                resultWidget(context, valueInput)
              ],
            );
          },
        ));
  }

  Widget resultWidget(BuildContext context, valueInput) {
    return Container(
                  margin: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          enabled: false,
                          controller: resultController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40.sp),
                        ),
                      ),
                      DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                              border: InputBorder.none),
                          textStyle: TextStyle(
                              fontSize: 40.sp,
                              color: Colors.black.withOpacity(0.5)),
                          trailingIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                          onSelected: (value) {
                            context.read<LongBloc>().add(DropDownMenuResult(
                                dropDownMenuResult: value ?? ''));
                            onLogic(context,
                                inputValue: valueInput,
                                inputResult: value!,
                                inputController: inputController);
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

  Widget inputWidget(BuildContext context, valueInput, valueResult) {
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
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.sp),
                  onChanged: (value) {
                    onLogic(context,
                        inputValue: valueInput,
                        inputResult: valueResult,
                        inputController: inputController);
                  }),
            ),
            DropdownMenu(
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
    if (inputValue == 'cm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(CmToMeter(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - m');
    } else if (inputValue == 'cm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(CmToCm(cm: double.tryParse(inputController.text) ?? 0));
      print('cm - cm');
    } else if (inputValue == 'm' && inputResult == 'm') {
      context
          .read<LongBloc>()
          .add(MeterToMeter(m: double.tryParse(inputController.text) ?? 0));
      print('m - m');
    } else if (inputValue == 'm' && inputResult == 'cm') {
      context
          .read<LongBloc>()
          .add(MeterToCm(m: double.tryParse(inputController.text) ?? 0));
      print('m - cm');
    }
  }
}
