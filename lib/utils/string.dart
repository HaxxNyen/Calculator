abstract class MyStrings {
  static RegExp regExAll =
      RegExp(r'([-+]?[0-9]*\.?[0-9]+[\/\+\-\x\%\(\)])+([-+]?[0-9]*\.?[0-9]+)');
  static RegExp regExPeriod = RegExp(r'([.]*0)(?!.*\d)');
}
