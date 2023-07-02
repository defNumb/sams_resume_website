// ignore_for_file: public_member_api_docs, sort_constructors_first
//import material
import 'package:flutter/material.dart';

// widget for screens up to 1366px wide
PreferredSizeWidget appBar1366({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 10,
    shadowColor: Colors.grey,
    centerTitle: true,
    toolbarHeight: 150,
    title: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        "Samuel Espinoza",
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily,
          fontSize: 50,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    // empty space
  );
}
