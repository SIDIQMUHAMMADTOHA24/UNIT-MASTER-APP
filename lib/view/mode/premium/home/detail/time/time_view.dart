import 'package:conversion_app/view/mode/premium/home/detail/time/bloc/time_bloc.dart';
import 'package:conversion_app/view/mode/premium/home/detail/time/data/data_time.dart';
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
                  showFormula(context,
                      inputValue: value, inputResult: valueResult);
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
                  showFormula(context,
                      inputValue: valueInput, inputResult: value);
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
    if (inputValue == 'Detik' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToDetik));
    }
    if (inputValue == 'Detik' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToMenit));
    }

    if (inputValue == 'Detik' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToJam));
    }

    if (inputValue == 'Detik' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToHari));
    }

    if (inputValue == 'Detik' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToMinggu));
    }

    if (inputValue == 'Detik' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToBulan));
    }

    if (inputValue == 'Detik' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToTahun));
    }

    if (inputValue == 'Detik' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToDekade));
    }

    if (inputValue == 'Detik' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.detikToAbad));
    }

    if (inputValue == 'Menit' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToDetik));
    }

    if (inputValue == 'Menit' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToJam));
    }

    if (inputValue == 'Menit' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToHari));
    }

    if (inputValue == 'Menit' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToMinggu));
    }

    if (inputValue == 'Menit' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToBulan));
    }

    if (inputValue == 'Menit' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToTahun));
    }

    if (inputValue == 'Menit' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToDekade));
    }

    if (inputValue == 'Menit' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.menitToAbad));
    }

    if (inputValue == 'Jam' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToDetik));
    }

    if (inputValue == 'Jam' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToMenit));
    }

    if (inputValue == 'Jam' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToJam));
    }

    if (inputValue == 'Jam' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToHari));
    }

    if (inputValue == 'Jam' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToMinggu));
    }

    if (inputValue == 'Jam' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToBulan));
    }

    if (inputValue == 'Jam' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToTahun));
    }

    if (inputValue == 'Jam' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToDekade));
    }

    if (inputValue == 'Jam' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.jamToAbad));
    }

// Lanjutkan dengan kondisi lain sesuai dengan jenis konversi yang Anda perlukan.
    if (inputValue == 'Hari' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToDetik));
    }

    if (inputValue == 'Hari' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToMenit));
    }

    if (inputValue == 'Hari' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToJam));
    }

    if (inputValue == 'Hari' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToHari));
    }

    if (inputValue == 'Hari' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToMinggu));
    }

    if (inputValue == 'Hari' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToBulan));
    }

    if (inputValue == 'Hari' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToTahun));
    }

    if (inputValue == 'Hari' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToDekade));
    }

    if (inputValue == 'Hari' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.hariToAbad));
    }

// Lanjutkan dengan kondisi lain sesuai dengan jenis konversi yang Anda perlukan.
    if (inputValue == 'Minggu' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToDetik));
    }

    if (inputValue == 'Minggu' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToMenit));
    }

    if (inputValue == 'Minggu' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToJam));
    }

    if (inputValue == 'Minggu' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToHari));
    }

    if (inputValue == 'Minggu' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToMinggu));
    }

    if (inputValue == 'Minggu' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToBulan));
    }

    if (inputValue == 'Minggu' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToTahun));
    }

    if (inputValue == 'Minggu' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToDekade));
    }

    if (inputValue == 'Minggu' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.mingguToAbad));
    }

    if (inputValue == 'Bulan' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToDetik));
    }

    if (inputValue == 'Bulan' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToMenit));
    }

    if (inputValue == 'Bulan' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToJam));
    }

    if (inputValue == 'Bulan' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToHari));
    }

    if (inputValue == 'Bulan' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToMinggu));
    }

    if (inputValue == 'Bulan' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToBulan));
    }

    if (inputValue == 'Bulan' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToTahun));
    }

    if (inputValue == 'Bulan' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToDekade));
    }

    if (inputValue == 'Bulan' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.bulanToAbad));
    }

    if (inputValue == 'Tahun' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToDetik));
    }

    if (inputValue == 'Tahun' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToMenit));
    }

    if (inputValue == 'Tahun' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToJam));
    }

    if (inputValue == 'Tahun' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToHari));
    }

    if (inputValue == 'Tahun' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToMinggu));
    }

    if (inputValue == 'Tahun' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToBulan));
    }

    if (inputValue == 'Tahun' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToTahun));
    }

    if (inputValue == 'Tahun' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToDekade));
    }

    if (inputValue == 'Tahun' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.tahunToAbad));
    }

    if (inputValue == 'Dekade' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToDetik));
    }

    if (inputValue == 'Dekade' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToMenit));
    }

    if (inputValue == 'Dekade' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToJam));
    }

    if (inputValue == 'Dekade' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToHari));
    }

    if (inputValue == 'Dekade' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToMinggu));
    }

    if (inputValue == 'Dekade' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToBulan));
    }

    if (inputValue == 'Dekade' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToTahun));
    }

    if (inputValue == 'Dekade' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToDekade));
    }

    if (inputValue == 'Dekade' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.dekadeToAbad));
    }

    if (inputValue == 'Abad' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToDetik));
    }

    if (inputValue == 'Abad' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToMenit));
    }

    if (inputValue == 'Abad' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToJam));
    }

    if (inputValue == 'Abad' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToHari));
    }

    if (inputValue == 'Abad' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToMinggu));
    }

    if (inputValue == 'Abad' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToBulan));
    }

    if (inputValue == 'Abad' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToTahun));
    }

    if (inputValue == 'Abad' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToDekade));
    }

    if (inputValue == 'Abad' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(TimeConversion(
          value: inputValueAsDouble,
          conversionType: TimeConversionType.abadToAbad));
    }
  }

  void showFormula(
    BuildContext context, {
    required String inputValue,
    required String inputResult,
  }) {
    if (inputValue == 'Detik' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Detik' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 60'));
    }

    if (inputValue == 'Detik' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 3600'));
    }

    if (inputValue == 'Detik' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 86400'));
    }

    if (inputValue == 'Detik' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 604800'));
    }

    if (inputValue == 'Detik' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 2592000'));
    }

    if (inputValue == 'Detik' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 31536000'));
    }

    if (inputValue == 'Detik' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 315360000'));
    }

    if (inputValue == 'Detik' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: '3153600000'));
    }

    if (inputValue == 'Menit' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 60'));
    }

    if (inputValue == 'Menit' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 60'));
    }

    if (inputValue == 'Menit' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 1440'));
    }

    if (inputValue == 'Menit' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 10080'));
    }

    if (inputValue == 'Menit' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 43800'));
    }

    if (inputValue == 'Menit' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 525600'));
    }

    if (inputValue == 'Menit' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 5256000'));
    }

    if (inputValue == 'Menit' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 52560000'));
    }

    if (inputValue == 'Jam' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 3600'));
    }

    if (inputValue == 'Jam' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 60'));
    }

    if (inputValue == 'Jam' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Jam' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 24'));
    }

    if (inputValue == 'Jam' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 168'));
    }

    if (inputValue == 'Jam' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 730.001'));
    }

    if (inputValue == 'Jam' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 8760'));
    }

    if (inputValue == 'Jam' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 87600'));
    }

    if (inputValue == 'Jam' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 876000'));
    }

    if (inputValue == 'Hari' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 86400'));
    }

    if (inputValue == 'Hari' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 1440'));
    }

    if (inputValue == 'Hari' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 24'));
    }

    if (inputValue == 'Hari' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Hari' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 7'));
    }

    if (inputValue == 'Hari' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 30'));
    }

    if (inputValue == 'Hari' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 365'));
    }

    if (inputValue == 'Hari' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 3652'));
    }

    if (inputValue == 'Hari' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 36525'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 604800'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 10080'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 168'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 7'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Minggu' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 4'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 52.143'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 521.429'));
    }

    if (inputValue == 'Minggu' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 5214.29'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 2592000'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 43800'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 730.001'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 30.417'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 4.345'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Bulan' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 12'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 120'));
    }

    if (inputValue == 'Bulan' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 1200'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 31536000'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 525600'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 8760'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 365.25'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 52.143'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 12'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Tahun' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 10'));
    }

    if (inputValue == 'Tahun' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 100'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 315360000'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 5256000'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 87600'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 3652.5'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 521.429'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 120'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 10'));
    }

    if (inputValue == 'Dekade' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }

    if (inputValue == 'Dekade' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dibagi 10'));
    }

    if (inputValue == 'Abad' && inputResult == 'Detik') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 3153600000'));
    }

    if (inputValue == 'Abad' && inputResult == 'Menit') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 52560000'));
    }

    if (inputValue == 'Abad' && inputResult == 'Jam') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 876000'));
    }

    if (inputValue == 'Abad' && inputResult == 'Hari') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 36525'));
    }

    if (inputValue == 'Abad' && inputResult == 'Minggu') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 5214.29'));
    }

    if (inputValue == 'Abad' && inputResult == 'Bulan') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 1200'));
    }

    if (inputValue == 'Abad' && inputResult == 'Tahun') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 100'));
    }

    if (inputValue == 'Abad' && inputResult == 'Dekade') {
      context.read<TimeBloc>().add(ShowFormula(formula: 'dikali 10'));
    }

    if (inputValue == 'Abad' && inputResult == 'Abad') {
      context.read<TimeBloc>().add(ShowFormula(formula: ''));
    }
  }
}
