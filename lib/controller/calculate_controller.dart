import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
  TextEditingController inputTextController = TextEditingController();
  var userInput = "";
  var userOutput = "";
  late TextSelection previousSelection;
  bool isSelection = false;

  int cursorPosition = 0;

  /// Equal Button Pressed Func
  equalPressed() {
    evaluateExpression();
    inputTextController.text = userOutput;
    userOutput = "";

    update();
  }

  evaluateExpression() {
    String userInputFC = inputTextController.text;
    userInputFC = userInputFC.replaceAll("x", "*");
    Parser p = Parser();

    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    userOutput = eval.toString().replaceAll(regex, '');
  }

  /// Clear Button Pressed Func
  clearInputAndOutput() {
    userInput = "";
    userOutput = "";
    inputTextController.text = "";
    isSelection = false;

    update();
  }

  /// Delete Button Pressed Func
  deleteBtnAction() {
    if (isNotEmptyInputText()) {
      if (isSelection) {
        cursorPosition = 0;
        updateCursorPosition('');
        inputTextController.text = StringUtils.removeCharAtPosition(
            inputTextController.text, cursorPosition);
        cursorPosition -= 1;
        inputTextController.selection = TextSelection(
            baseOffset: cursorPosition, extentOffset: cursorPosition);
      } else {
        inputTextController.text = inputTextController.text
            .substring(0, inputTextController.text.length - 1);
      }
    }

    if (isValidExpression()) {
      evaluateExpression();
    } else {
      userOutput = "";
    }

    update();
  }

  /// on Number Button Tapped
  onBtnTapped(List<String> buttons, int index) {
    debugPrint("input: ${buttons[index]}");

    if (isSelection) {
      debugPrint("Selection");
      debugPrint("Old Position is: $cursorPosition");

      cursorPosition = 0;
      updateCursorPosition("");
      inputTextController.text = StringUtils.addCharAtPosition(
          inputTextController.text, buttons[index], cursorPosition);
      cursorPosition += 1;
      inputTextController.selection = TextSelection(
          baseOffset: cursorPosition, extentOffset: cursorPosition);

      debugPrint("New Position is: $cursorPosition");
    } else {
      inputTextController.text += buttons[index];
    }

    if (isValidExpression()) {
      evaluateExpression();
    }

    update();
  }

  bool isValidExpression() {
    RegExp regex = RegExp(
        r'([-+]?[0-9]*\.?[0-9]+[\/\+\-\x\%\(\)])+([-+]?[0-9]*\.?[0-9]+)');

    return regex.hasMatch(inputTextController.text) ? true : false;
  }

  void getCursorPosition() {
    previousSelection = inputTextController.selection;

    cursorPosition = previousSelection.base.offset;

    debugPrint("Current Position is: $cursorPosition");
    if (isNotEmptyInputText()) {
      isSelection = true;
    }
  }

  bool isNotEmptyInputText() {
    return inputTextController.text.isNotEmpty ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
    inputTextController.dispose();
  }

  void updateCursorPosition(String val) {
    previousSelection = inputTextController.selection;
    cursorPosition = previousSelection.base.offset;

    update();
  }
}
