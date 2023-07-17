import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  // scroll controller
  ScrollController _scrollController = ScrollController();

  // init and dispose scroll controller
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // screen width
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> parrafos = [
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: RichText(
            text: const TextSpan(
              text: "I am a highly skilled and passionate",
              style: TextStyle(
                color: Color.fromARGB(141, 255, 255, 255),
                fontFamily: 'Inter',
                fontSize: 17,
                fontWeight: FontWeight.w300,
                height: 1.6,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Flutter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text:
                      ' developer with 3 years of experience in the industry. With a strong foundation in mobile app development, I specialize in creating stunning and high-performing applications using the Flutter framework. My expertise lies in building cross-platform apps that deliver seamless user experiences on both Android and iOS platforms.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(141, 255, 255, 255),
                  ),
                ),
                TextSpan(
                  text:
                      '\n\nI have a deep understanding of the Flutter ecosystem and its powerful capabilities, allowing me to create robust and scalable solutions that meet the unique needs of each project. My attention to detail, combined with a creative and problem-solving mindset, enables me to design intuitive user interfaces and craft efficient and maintainable code.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(141, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
    // container with a center text with the title of the widget
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 1366 ? 30 : 150.0),
      child: SizedBox(
        // height: _height(screenWidth),
        // width: screenWidth,
        child: Padding(
          padding: EdgeInsets.fromLTRB(screenWidth < 1366 ? 0 : 150,
              screenWidth < 1366 ? 0 : 10, screenWidth < 1366 ? 0 : 150, 0),
          child: Column(
            mainAxisAlignment: screenWidth < 1366
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: parrafos,
          ),
        ),
      ),
    );
  }

  double _height(double screenWidth) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final thresholds = {
      350: 1.3,
      400: 1.5,
      450: 1.8,
      500: 2,
      550: 2.2,
      600: 2.4,
      650: 2.6,
      700: 2.8,
      750: 3,
      800: 3.2,
      850: 3.4,
      900: 3.6,
      950: 3.8,
      1000: 3.8,
      1050: 3.8,
      1100: 3.8,
      1150: 3.8,
      1200: 3.8,
      1250: 3.8,
      1300: 3.8,
      1350: 3.8,
      1400: 1.6,
      1450: 1.8,
      1500: 1.9,
      1550: 2,
      1600: 2,
      1650: 2.1,
      1700: 2.3,
      1750: 2.4,
      1800: 2.2,
      1850: 2.3,
      1900: 2.6,
    };
    for (final entry in thresholds.entries) {
      if (screenWidth < entry.key) return deviceHeight / entry.value;
    }

    return deviceHeight / 2.5; // Fallback case if screenWidth >= 1920
  }
}
