import 'package:flutter/material.dart';

class TitleBars extends StatefulWidget {
  final String title;
  const TitleBars({super.key, required this.title});
  @override
  State<TitleBars> createState() => _TitleBarsState();
}

class _TitleBarsState extends State<TitleBars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  text: widget.title,
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
          ],
        ),
      ),
    );
  }
}
