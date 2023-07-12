import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../blocs/hover_state/cubit/hover_cubit.dart';

class SocialButtons extends StatefulWidget {
  const SocialButtons({super.key});

  @override
  State<SocialButtons> createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  late bool isHovering1 = false;
  late bool isHovering2 = false;
  late bool isHovering3 = false;

  @override
  Widget build(BuildContext context) {
    // width of device
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HoverCubit, HoverState>(
      builder: (context, state) {
        return AnimatedContainer(
          height: 35,
          duration: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment: screenWidth > 1366
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isHovering1 = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isHovering1 = false;
                  });
                },
                child: GestureDetector(
                  onTap: () async {
                    Uri url = Uri.parse("https://github.com/defNumb");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: FaIcon(
                      FontAwesomeIcons.github,
                      color: isHovering1 ? Colors.blue : Colors.white,
                      size: isHovering1 ? 30 : 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isHovering2 = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isHovering2 = false;
                  });
                },
                child: GestureDetector(
                  onTap: () async {
                    Uri url = Uri.parse(
                        "https://www.linkedin.com/in/sam-p-espinoza/");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: isHovering2 ? Colors.blue : Colors.white,
                      size: isHovering2 ? 30 : 25,
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
