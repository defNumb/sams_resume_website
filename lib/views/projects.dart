import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  final bool isHovering;
  const Projects({
    super.key,
    required this.isHovering,
  });

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double _opacity(int index, int currentIndex) {
    // use if statement to check whether index is equal to 0, 1 or -1
    // if the current index is equal to the index of the container then return 1
    // else return 0.5
    if (index == currentIndex) {
      return 1;
    } else if (currentIndex == -1) {
      return 1;
    } else {
      return 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        boxShadow: widget.isHovering
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
        borderRadius: BorderRadius.circular(10),
        color: widget.isHovering
            ? Colors.transparent
            : const Color.fromARGB(94, 80, 79, 79),
        // shadow
      ),
      child: Container(height: 500, width: 500),
    );
  }
}
