import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/widgets/hover_containers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blocs/hover_state/cubit/hover_cubit.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    launchURL() async {
      String url =
          'https://drive.google.com/file/d/1C67bt3mBN6klEyjd986DGbKmxNfvbxJq/view?usp=drive_link/'; // Replace with your phone number
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    return BlocBuilder<HoverCubit, HoverState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(
            children: [
              HoverContainer(
                dates: 'Feb 2020 - Feb 2023',
                company: 'Pet Market Bolivia',
                position: 'Lead Software Developer',
                description:
                    'Led the design and development of internal and external applications for the company. Built a Flutter application for the company\'s customers to order products and services. Delivering high-quality code and responsive and intuitive user interfaces.',
                technologies: const [
                  'Dart/Flutter',
                  'Firebase',
                  'ASP.NET Core',
                  'SQL Server'
                ],
                isHovering: state.isHovering1,
                index: 0,
              ),
              // a text button saying "View complete resume"

              MouseRegion(
                onEnter: (PointerEnterEvent event) {
                  setState(() {
                    isHovering = true;
                  });
                },
                onExit: (PointerExitEvent event) {
                  setState(() {
                    isHovering = false;
                  });
                },
                child: TextButton(
                  onPressed: () {
                    launchURL();
                  },
                  child: Text(
                    'View complete resume',
                    style: TextStyle(
                      color: isHovering ? Colors.blue : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
