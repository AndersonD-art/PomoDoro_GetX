import 'package:flutter/material.dart';

class StopWatchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;
  const StopWatchButton({
    Key? key,
    required this.text,
    required this.icon,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        textStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 25,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
