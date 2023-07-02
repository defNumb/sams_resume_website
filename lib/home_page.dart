import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/views/about_me.dart';
import 'package:sams_website/views/experience.dart';
import 'package:sams_website/views/projects.dart';
import 'appBar/app_bar_1366.dart';
import 'appBar/app_bar_1920.dart';
import 'blocs/selected_app_bar_button/selected_app_bar_button_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CarouselController _controller;
  List<Widget> widgets = const [
    AboutMe(),
    Experience(),
    Projects(),
  ];
  // initialize carousel controller and dispose

  @override
  void initState() {
    _controller = CarouselController();
    super.initState();
  }
  @override
  void dispose() {
    _controller;
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // variables with screen height and width
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: screenWidth < 1366
            ? appBar1366(context: context)
            : appBar1920(
                context: context,
                callback: (() => _updatePage(context
                    .read<SelectedAppBarButtonCubit>()
                    .state
                    .selectedButton)),
              ),
        body: Center(
          child: CarouselSlider.builder(
            carouselController: _controller,
            options: CarouselOptions(
                scrollDirection: Axis.vertical,
                aspectRatio: 16 / 9,
                autoPlay: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  // change selected button
                  context
                      .read<SelectedAppBarButtonCubit>()
                      .updateSelectedButton(index);
                }),
            itemCount: widgets.length,
            itemBuilder: (context, index, realIndex) {
              // return a list view with the widgets
              return widgets[index];
            },
          ),
        ),
        persistentFooterButtons: [
          // centered footer buttons to terms and conditions, privacy policy, etc.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // registered trademark symbol with text
              Flexible(
                child: Text(
                  '© Samuel P. Espinoza. 2023',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  child: Text('Contact',
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updatePage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }
}
