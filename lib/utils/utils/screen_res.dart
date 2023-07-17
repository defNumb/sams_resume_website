import 'package:flutter/material.dart';

class ScreenResWidget extends StatefulWidget {
  final double height;
  final double width;

  const ScreenResWidget({super.key, required this.height, required this.width});

  @override
  State<ScreenResWidget> createState() => _ScreenResWidgetState();
}

class _ScreenResWidgetState extends State<ScreenResWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Height: ${widget.height}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          'Width: ${widget.width}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
