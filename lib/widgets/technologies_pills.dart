import 'package:flutter/material.dart';

class TechnologiesPill extends StatefulWidget {
  final List<String> technologies;
  const TechnologiesPill({super.key, required this.technologies});

  @override
  State<TechnologiesPill> createState() => _TechnologiesPillState();
}

class _TechnologiesPillState extends State<TechnologiesPill> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            alignment: WrapAlignment.start,
            spacing: 10.0, // gap between adjacent chips
            runSpacing: 0.0, // gap between lines
            children: widget.technologies.map((e) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(33, 33, 149, 243),
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
