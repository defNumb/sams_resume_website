import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/blocs/hover_state/cubit/hover_cubit.dart';
import 'package:sams_website/widgets/technologies_pills.dart';

class HoverContainer extends StatefulWidget {
  // This container will have data that will need to be passed in by the parent widget
  // this data will be used to build the container.
  // the data needed for this container is from experience part of my resume
  // these variables are:
  final String dates;
  final String company;
  final String position;
  final String description;
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

  Widget _buildChildren(BuildContext context, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 25, 15, 0),
          child: Text(
            widget.dates,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 23, widget.isHovering ? 0 : 20, 0),
                  child: Text(
                    widget.position,
                    style: TextStyle(
                      color: widget.index ==
                              context.read<HoverCubit>().state.currentIndex
                          ? Colors.blue
                          : Colors.white,
                      fontFamily: 'Inter',
                      fontSize: screenWidth < 1666 ? 16 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // little arrow pointing up right
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: widget.index ==
                            context.read<HoverCubit>().state.currentIndex
                        ? Colors.blue
                        : Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            Text(
              widget.company,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    color: Color.fromARGB(104, 255, 255, 255),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            TechnologiesPill(technologies: widget.technologies),
          ],
        ),
      ],
    );
  }
  // _buildChildren2

  Widget _buildChildren2(BuildContext context, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              widget.dates,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 0, widget.isHovering ? 0 : 20, 0),
                  child: Text(
                    widget.position,
                    style: TextStyle(
                      color: widget.index ==
                              context.read<HoverCubit>().state.currentIndex
                          ? Colors.blue
                          : Colors.white,
                      fontFamily: 'Inter',
                      fontSize: screenWidth < 1666 ? 16 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // little arrow pointing up right
              Icon(
                Icons.arrow_forward_ios,
                color: widget.index ==
                        context.read<HoverCubit>().state.currentIndex
                    ? Colors.blue
                    : Colors.white,
                size: 20,
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  widget.company,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
            child: SizedBox(
              width: screenWidth < 1366
                  ? MediaQuery.of(context).size.width / 1.3
                  : MediaQuery.of(context).size.width / 3,
              child: Text(
                widget.description,
                style: const TextStyle(
                  color: Color.fromARGB(104, 255, 255, 255),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          TechnologiesPill(technologies: widget.technologies)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.read<HoverCubit>().state.currentIndex;
    // width of device
    double screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (PointerEnterEvent event) =>
          context.read<HoverCubit>().changeHover1(false, widget.index),
      onExit: (PointerExitEvent event) =>
          context.read<HoverCubit>().changeHover1(true, -1),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: _opacity(widget.index, currentIndex),
        child: Container(
          // rounded corners
          decoration: BoxDecoration(
            boxShadow: !widget.isHovering
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
          child: screenWidth < 1366
              ? _buildChildren2(context, screenWidth)
              : _buildChildren(context, screenWidth),
        ),
      ),
    );
  }
}
