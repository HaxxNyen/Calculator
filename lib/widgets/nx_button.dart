import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NxButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback buttonTapped;

  const NxButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: buttonTapped,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
