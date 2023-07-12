import 'package:flutter/material.dart';
import 'package:sams_website/appBar/social_buttons.dart';

import 'appbar_buttons.dart';

class VerticalAppBar extends StatefulWidget {
  final VoidCallback callback;
  const VerticalAppBar({super.key, required this.callback});

  @override
  State<VerticalAppBar> createState() => _VerticalAppBarState();
}

class _VerticalAppBarState extends State<VerticalAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      width: MediaQuery.of(context).size.width / 2.5,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Sam Espinoza",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily:
                      Theme.of(context).textTheme.displayLarge!.fontFamily,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // text saying "Flutter Developer"
            Text(
              "Flutter Developer",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontFamily:
                    Theme.of(context).textTheme.displayLarge!.fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            // empty space

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    title: "ABOUT ME",
                    index: 0,
                    route: '/home',
                    callback: widget.callback),
                CustomButton(
                    title: "EXPERIENCE",
                    index: 1,
                    route: '/experience',
                    callback: widget.callback),
                CustomButton(
                    title: "PROJECTS",
                    index: 2,
                    route: '/projects',
                    callback: widget.callback),
              ],
            ),
            // SizedBox(height: MediaQuery.of(context).size.height / 3.5),
            // row with icons for social media
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            const SocialButtons()
          ],
        ),
      ),
    );
  }
}
