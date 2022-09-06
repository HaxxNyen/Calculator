import 'package:flutter/cupertino.dart';

class NxButton extends StatelessWidget {
  NxButton({Key? key, this.color, this.textColor, required this.btnText})
      : super(key: key);
  dynamic color;
  dynamic textColor;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(color: textColor, fontSize: 26),
            ),
          ),
        ),
      ),
    );
  }
}
