import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/widgets/hover_containers.dart';

import '../blocs/hover_state/cubit/hover_cubit.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    // variables with screen height and width
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // list of widgets
    List<Widget> widgets = <Widget>[
      // container 500x600 with a text saying "Experience"
      Flexible(
        child: MouseRegion(
          onEnter: (PointerEnterEvent event) =>
              context.read<HoverCubit>().changeHover1(false, 0),
          onExit: (PointerExitEvent event) =>
              context.read<HoverCubit>().changeHover1(true, -1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: BlocBuilder<HoverCubit, HoverState>(
              builder: (context, state) {
                return HoverContainer(
                  dates: 'Feb 2020 - Feb 2023',
                  company: 'Pet Market Bolivia',
                  position: 'Lead Software Developer',
                  description: const [],
                  technologies: const [],
                  isHovering: state.isHovering1,
                  index: 0,
                );
              },
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
        height: 20,
      ),
      Flexible(
        child: MouseRegion(
          onEnter: (PointerEnterEvent event) =>
              context.read<HoverCubit>().changeHover2(false, 1),
          onExit: (PointerExitEvent event) =>
              context.read<HoverCubit>().changeHover2(true, -1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: BlocBuilder<HoverCubit, HoverState>(
              builder: (context, state) {
                return HoverContainer(
                  dates: 'Feb 2020 - Feb 2023',
                  company: 'Pet Market Bolivia',
                  position: 'Lead Software Developer',
                  description: const [],
                  technologies: const [],
                  isHovering: state.isHovering2,
                  index: 1,
                );
              },
            ),
          ),
        ),
      ),
    ];
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // rich text with the title of the widget
            RichText(
              text: TextSpan(
                text: "Experience",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily:
                      Theme.of(context).textTheme.displayLarge!.fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // sized box
            const SizedBox(height: 50),
            Flexible(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (screenWidth < 1366) {
                    // Set the breakpoint as needed
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widgets,
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widgets,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
