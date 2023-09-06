// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sams_website/widgets/image_slider.dart';

import '../blocs/hover_state/cubit/hover_cubit.dart';

class MobileProjectContainer extends StatefulWidget {
  final String appName;
  final String description;
  final String technologies;
  final List<String> imagesPath;
  final int index;
  final bool isHovering;
  final String githubLink;

  const MobileProjectContainer({
    Key? key,
    required this.appName,
    required this.description,
    required this.technologies,
    required this.imagesPath,
    required this.index,
    required this.isHovering,
    required this.githubLink,
  }) : super(key: key);

  @override
  State<MobileProjectContainer> createState() => _MobileProjectContainerState();
}

class _MobileProjectContainerState extends State<MobileProjectContainer> {
  double _opacity(int index, int currentIndex) {
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
    int currentIndex = context.read<HoverCubit>().state.currentIndex;
    double screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (PointerEnterEvent event) =>
          context.read<HoverCubit>().changeHover3(false, widget.index),
      onExit: (PointerExitEvent event) =>
          context.read<HoverCubit>().changeHover3(true, -1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _opacity(widget.index, currentIndex),
          child: Container(
            height: screenWidth < 600 ? 400 : 850,
            // rounded corners
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(94, 80, 79, 79),
              // shadow
            ),
            child: Row(
              children: [
                // images slider
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ImageSlider(
                        urlImages: widget.imagesPath,
                      ),
                    ),
                  ),
                ),
                // text
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // website name
                        Text(
                          widget.appName,
                          style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 14
                                  : (screenWidth * 0.011),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        // description
                        Text(
                          widget.description,
                          style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 14
                                  : (screenWidth * 0.008),
                              color: Colors.white,
                              fontFamily: 'Inter'),
                        ),

                        SizedBox(height: screenWidth * 0.01),
                        // technologies
                        Text(
                          widget.technologies,
                          style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 14
                                  : (screenWidth * 0.008),
                              color: Colors.white,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        // website link
                        GestureDetector(
                          onTap: () {
                            // open website using url_launcher
                          },
                          child: Text(
                            'CONTACT ME FOR ACCESS TO REPOSITORY AND DEMO',
                            style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 14
                                  : (screenWidth * 0.008),
                              fontFamily: 'Inter',
                              color: currentIndex == widget.index
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
