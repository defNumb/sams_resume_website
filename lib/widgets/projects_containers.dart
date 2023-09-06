// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blocs/hover_state/cubit/hover_cubit.dart';

class ProjectContainers extends StatefulWidget {
  final String websiteName;
  final String description;
  final String technologies;
  final String websiteLink;
  final String imagePath;
  final int index;
  final bool isHovering;
  const ProjectContainers({
    Key? key,
    required this.websiteName,
    required this.description,
    required this.technologies,
    required this.websiteLink,
    required this.imagePath,
    required this.index,
    required this.isHovering,
  }) : super(key: key);

  @override
  State<ProjectContainers> createState() => _ProjectContainersState();
}

class _ProjectContainersState extends State<ProjectContainers> {
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

    launchURL() async {
      String url = widget.websiteLink; // Replace with your phone number
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    return MouseRegion(
      onEnter: (PointerEnterEvent event) =>
          context.read<HoverCubit>().changeHover2(false, widget.index),
      onExit: (PointerExitEvent event) =>
          context.read<HoverCubit>().changeHover2(true, -1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _opacity(widget.index, currentIndex),
          child: Container(
            height: 250,
            // rounded corners
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(94, 80, 79, 79),
              // shadow
            ),
            child: Row(
              children: [
                // image
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(widget.imagePath),
                          fit: BoxFit.fitHeight,
                        ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // website name
                        Text(
                          widget.websiteName,
                          style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 18
                                  : (screenWidth * 0.011),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Inter'),
                        ),
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
                        // technologies
                        Text(
                          widget.technologies,
                          style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 12
                                  : (screenWidth * 0.008),
                              color: Colors.white,
                              fontFamily: 'Inter'),
                        ),
                        // website link
                        GestureDetector(
                          onTap: () {
                            // open website using url_launcher
                            launchURL();
                          },
                          child: Text(
                            widget.websiteLink,
                            style: TextStyle(
                              fontSize: screenWidth < 700
                                  ? 14
                                  : (screenWidth * 0.008),
                              color: currentIndex == widget.index
                                  ? Colors.blue
                                  : Colors.white,
                              fontFamily: 'Inter',
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
