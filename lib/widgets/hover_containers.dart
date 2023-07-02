import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/blocs/hover_state/cubit/hover_cubit.dart';

class HoverContainer extends StatefulWidget {
  // This container will have data that will need to be passed in by the parent widget
  // this data will be used to build the container.
  // the data needed for this container is from experience part of my resume
  // these variables are:
  final String dates;
  final String company;
  final String position;
  final List<String> description;
  final List<String> technologies;
  final bool isHovering;
  final int index;
  
  const HoverContainer({
    super.key,
    required this.dates,
    required this.company,
    required this.position,
    required this.description,
    required this.technologies,
    required this.isHovering,
    required this.index,
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {

  // a method that will return a double based on the current index of the hover state
  // this will be used to determine the opacity of the container
  double _opacity(int index) {
    // use if statement to check whether index is equal to 0, 1 or -1
    // if the current index is equal to the index of the container then return 1
    // else return 0.5
    if (index == context.read<HoverCubit>().state.currentIndex) {
      return 1;
    } else if (context.read<HoverCubit>().state.currentIndex == -1) {
      return 1;
    } else {
      return 0.5;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity(widget.index),
      child: Container(
        // rounded corners
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isHovering
              ? Colors.transparent
              : const Color.fromARGB(75, 80, 79, 79),
        ),
        height: 500,
        width: 600,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.dates,
                  style: TextStyle(
                    color: widget.index == context.read<HoverCubit>().state.currentIndex ? Colors.blue : Colors.white,
                    fontFamily: 'MontBlanc',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
