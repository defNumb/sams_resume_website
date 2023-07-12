import 'package:flutter/material.dart';
import 'package:sams_website/appBar/appbar_buttons.dart';
import 'package:sams_website/appBar/social_buttons.dart';
// Appbar widget for screens up to 1920px wide

PreferredSizeWidget appBar1920(
    {required BuildContext context, required VoidCallback callback}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    shadowColor: Colors.grey,
    toolbarHeight: 200,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sam Espinoza",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .fontFamily,
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
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                // empty space
                const SizedBox(width: 200),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        CustomButton(
                            title: "ABOUT ME",
                            index: 0,
                            route: '/home',
                            callback: callback),
                        CustomButton(
                            title: "EXPERIENCE",
                            index: 1,
                            route: '/experience',
                            callback: callback),
                        CustomButton(
                            title: "PROJECTS",
                            index: 2,
                            route: '/projects',
                            callback: callback),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // row with icons for social media
                    const SocialButtons()
                  ],
                ),
              ],
            ),
          ),
          // empty space
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Divider(
              color: Colors.white,
              thickness: 1,
              indent: 500,
              endIndent: 500,
            ),
          ),
        ],
      ),
    ),
  );
}
