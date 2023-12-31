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
        child: RichText(
          text: const TextSpan(
            text: "I am a highly skilled and passionate",
            style: TextStyle(
              color: Color.fromARGB(85, 255, 255, 255),
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
                    ' developer with 3 years of experience in the industry. With a strong foundation in mobile app development, I specialize in creating stunning and high-performing applications using the ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(85, 255, 255, 255),
                ),
              ),
              TextSpan(
                text: ' Flutter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text:
                    ' framework. My expertise lies in building cross-platform apps that deliver seamless user experiences on both Android and iOS platforms.',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(85, 255, 255, 255),
                ),
              ),
              TextSpan(
                text: '\n\nI have a deep understanding of the',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(85, 255, 255, 255),
                ),
              ),
              TextSpan(
                text: ' Flutter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text:
                    ' ecosystem and its powerful capabilities, allowing me to create robust and scalable solutions that meet the unique needs of each project. My',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(85, 255, 255, 255),
                ),
              ),
              TextSpan(
                text: ' attention to detail',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(125, 255, 255, 255),
                ),
              ),
              TextSpan(
                text: ', combined with a creative and ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(85, 255, 255, 255),
                ),
              ),
              TextSpan(
                text: 'problem-solving mindset',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(125, 255, 255, 255),
                ),
              ),
              TextSpan(
                text:
                    ', enables me to design intuitive user interfaces and craft efficient and maintainable code.',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(85, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    // container with a center text with the title of the widget
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 1366 ? 30 : 150.0),
      child: SizedBox(
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
}
