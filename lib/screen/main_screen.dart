import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
import '../controller/theme_controller.dart';
import '../controller/calculate_controller.dart';
import '../utils/colors.dart';
import '../widgets/nx_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<String> buttonsList = [
    'C',
    'DEL',
    '+/-',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '%',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: SafeArea(
          child: Column(
            children: [
              GetBuilder<CalculateController>(builder: (context) {
                return outPutSection(themeController, controller);
              }),
              inPutSection(themeController, controller),
            ],
          ),
        ),
      );
    });
  }

  /// In put Section - Enter Numbers
  Expanded inPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: themeController.isDark
                ? DarkColors.sheetBgColor
                : LightColors.sheetBgColor,
          ),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttonsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                switch (index) {

                  /// CLEAR BTN
                  case 0:
                    return NxButton(
                        buttonTapped: () {
                          controller.clearInputAndOutput();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.operatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.operatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);

                  /// DELETE BTN
                  case 1:
                    return NxButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.operatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.operatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);

                  /// Plus/Minus Button
                  case 2:
                    return NxButton(
                        buttonTapped: () {
                          //controller.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnOperatorBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);
                  case 3:
                    return NxButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttonsList, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnOperatorBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);
                  case 7:
                    return NxButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttonsList, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnOperatorBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);
                  case 11:
                    return NxButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttonsList, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnOperatorBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);
                  case 15:
                    return NxButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttonsList, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnOperatorBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);

                  /// EQUAL BTN
                  case 19:
                    return NxButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.leftOperatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.operatorBtnTextColor,
                        text: buttonsList[index]);

                  default:
                    return NxButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttonsList, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: isOperator(buttonsList[index])
                            ? LightColors.operatorColor
                            : themeController.isDark
                                ? Colors.white
                                : Colors.black,
                        text: buttonsList[index]);
                }
              }),
        ));
  }

  /// Out put Section - Show Result
  Expanded outPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: 100,
          height: 45,
          decoration: BoxDecoration(
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    themeController.lightTheme();
                  },
                  child: Icon(
                    Icons.light_mode_outlined,
                    color: themeController.isDark ? Colors.grey : Colors.black,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    themeController.darkTheme();
                  },
                  child: Icon(
                    Icons.dark_mode_outlined,
                    color: themeController.isDark ? Colors.white : Colors.grey,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) => controller.updateCursorPosition(val),
                onTap: controller.getCursorPosition,
                //readOnly: true,
                //showCursor: true,
                maxLines: 2,
                cursorRadius: const Radius.circular(2),
                cursorWidth: 4,
                cursorHeight: 8,
                keyboardType: TextInputType.none,
                decoration: const InputDecoration(border: InputBorder.none),
                controller: controller.inputTextController,
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: themeController.isDark ? Colors.white : Colors.black,
                    fontSize: 40),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(controller.userOutput,
                    style: TextStyle(
                        color: themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 32)),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  ///
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+") {
      return true;
    }
    return false;
  }
}
