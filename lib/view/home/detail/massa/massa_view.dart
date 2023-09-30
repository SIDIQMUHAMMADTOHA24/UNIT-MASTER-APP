import 'package:conversion_app/view/home/detail/massa/bloc/massa_bloc.dart';
import 'package:conversion_app/view/home/detail/massa/data/data_massa.dart';
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
            // final fontSize = state['fontSize'];
            return Column(
              children: [
                // input
                inputWidget(
                    context: context,
                    valueInput: valueInput,
                    valueResult: valueResult,
                    fontSize: 40),

                //output
                resultWidget(
                    context: context,
                    valueInput: valueInput,
                    valueResult: valueResult,
                    fontSize: 40),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '',
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
              child: AnimatedBuilder(
                animation: inputController,
                builder: (context, child) => TextField(
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
                      .read<MassaBloc>()
                      .add(DropDownMenuInput(dropDownMenuInput: value ?? ''));
                  onLogic(context,
                      inputValue: value!,
                      inputResult: valueResult,
                      inputController: inputController);
                  // showFormula(context,
                  //     inputValue: value, inputResult: valueResult);
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
                      .read<MassaBloc>()
                      .add(DropDownMenuResult(dropDownMenuResult: value ?? ''));
                  onLogic(context,
                      inputValue: valueInput,
                      inputResult: value!,
                      inputController: inputController);
                  // showFormula(context,
                  //     inputValue: valueInput, inputResult: value);
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
    if (inputValue == 'kg' && inputResult == 'g') {
      context
          .read<MassaBloc>()
          .add(KgToGram(kg: double.tryParse(inputController.text) ?? 0));
      print('kg - g');
    }
    if (inputValue == 'kg' && inputResult == 'kg') {
      context
          .read<MassaBloc>()
          .add(KgToKg(kg: double.tryParse(inputController.text) ?? 0));
      print('kg - kg');
    }
  }
}
