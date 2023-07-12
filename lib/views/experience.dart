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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) =>
            context.read<HoverCubit>().changeHover1(false, 0),
        onExit: (PointerExitEvent event) =>
            context.read<HoverCubit>().changeHover1(true, -1),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 1366 ? 15 : 100,
          ),
          child: BlocBuilder<HoverCubit, HoverState>(
            builder: (context, state) {
              return HoverContainer(
                dates: 'Feb 2020 - Feb 2023',
                company: 'Pet Market Bolivia',
                position: 'Lead Software Developer',
                description:
                    'Led the design and development of internal and external applications for the company. Leveraged ASP.NET Core and SQL Server to build a REST API that powers the company\'s mobile and web applications. Built a Flutter application for the company\'s customers to order products and services. Delivering high-quality code and responsive and intuitive user interfaces.',
                technologies: const [
                  'Dart/Flutter',
                  'Firebase',
                  'ASP.NET Core',
                  'SQL Server'
                ],
                isHovering: state.isHovering1,
                index: 0,
              );
            },
          ),
        ),
      ),
    );
  }
}
