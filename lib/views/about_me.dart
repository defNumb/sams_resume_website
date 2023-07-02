import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    // container with a center text with the title of the widget
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: "About Me",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontFamily:
                        Theme.of(context).textTheme.displayLarge!.fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // sized box
            const SizedBox(height: 20),
            Flexible(
              child: RichText(
                text: const TextSpan(
                    text: "I am a software developer that focuses on",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Flutter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ]),
              ),
            ), // another rich text with the body of the widget
          ],
        ),
      ],),
    );
  }
}
