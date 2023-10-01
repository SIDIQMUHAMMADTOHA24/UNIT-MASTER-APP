import 'package:conversion_app/view/home/detail/time/bloc/time_bloc.dart';
import 'package:conversion_app/view/home/detail/time/data/data_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeView extends StatefulWidget {
  const TimeView({super.key});

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void _updateSize() {
    final textLength = inputController.text.length;
    context.read<TimeBloc>().add(FontSize(size: textLength.toDouble()));
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
            'Konversi Waktu',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.8)),
          ),
        ),
        body: BlocBuilder<TimeBloc, Map<String, dynamic>>(
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
                    fontSize: 35),

                //output
                resultWidget(
                    context: context,
                    valueInput: valueInput,
                    valueResult: valueResult,
                    fontSize: 35),
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
                      .read<TimeBloc>()
                      .add(DropDownMenuInput(dropDownMenuInput: value ?? ''));
                  onLogic(context,
                      inputValue: value!,
                      inputResult: valueResult,
                      inputController: inputController);
                  // showFormula(context,
                  //     inputValue: value, inputResult: valueResult);
                },
                dropdownMenuEntries: DataTime.listDataTime
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
                      .read<TimeBloc>()
                      .add(DropDownMenuResult(dropDownMenuResult: value ?? ''));
                  onLogic(context,
                      inputValue: valueInput,
                      inputResult: value!,
                      inputController: inputController);
                  // showFormula(context,
                  //     inputValue: valueInput, inputResult: value);
                },
                dropdownMenuEntries: DataTime.listDataTime
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

    if (inputValue == 'Detik') {
      if (inputResult == 'Menit') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToMenit));
      } else if (inputResult == 'Jam') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToJam));
      } else if (inputResult == 'Hari') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToHari));
      } else if (inputResult == 'Minggu') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToMinggu));
      } else if (inputResult == 'Bulan') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToBulan));
      } else if (inputResult == 'Tahun') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToTahun));
      } else if (inputResult == 'Dekade') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToDekade));
      } else if (inputResult == 'Abad') {
        context.read<TimeBloc>().add(TimeConversion(
            value: inputValueAsDouble,
            conversionType: TimeConversionType.detikToAbad));
      }
    }
  }
}
