// ignore_for_file: public_member_api_docs, sort_constructors_first
//import material
import 'package:flutter/material.dart';
import 'package:sams_website/appBar/social_buttons.dart';

// widget for screens up to 1366px wide
PreferredSizeWidget appBar1366({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    shadowColor: Colors.grey,
    centerTitle: true,
    toolbarHeight: 250,
    title: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Sam Espinoza",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // text saying "Flutter Developer"
          Text(
            "Flutter Developer",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 15),
          // text saying : '' I create beautiful and functional apps with Flutter"
          Text(
            "I create beautiful \nand functional apps with Flutter",
            style: TextStyle(
              color: const Color.fromARGB(181, 173, 171, 171),
              fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 25),
          const SocialButtons(),
          const SizedBox(height: 10), // divider
        ],
      ),
    ),
    // empty space
  );
}
