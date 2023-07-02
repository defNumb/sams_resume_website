import 'package:flutter/material.dart';

// Appbar widget for screens up to 360px wide
// appbar will look like  a hamburger menu

Widget appBar360(BuildContext context) {
  return AppBar(
    title: const Text('Pet Supply BO'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.account_circle),
      ),
    ],
  );
}
