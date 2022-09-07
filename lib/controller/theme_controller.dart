import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDark = false;

  lightTheme() {
    isDark = false;
    update();
  }

  darkTheme() {
    isDark = true;
    update();
  }
}
