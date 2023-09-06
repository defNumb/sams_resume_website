import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/appBar/standing_appbar.dart';
import 'package:sams_website/views/about_me.dart';
import 'package:sams_website/views/experience.dart';
import 'package:sams_website/views/projects.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'appBar/app_bar_1366.dart';
import 'blocs/selected_app_bar_button/selected_app_bar_button_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isScrollingProgrammatically = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  // initialize carousel controller and dispose

  @override
  void initState() {
    itemPositionsListener.itemPositions.addListener(() {
      if (!isScrollingProgrammatically) {
        int index = itemPositionsListener.itemPositions.value
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .toList()[0]
            .index;
        context.read<SelectedAppBarButtonCubit>().updateSelectedButton(index);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    itemScrollController;
    scrollOffsetController;
    itemPositionsListener;
    scrollOffsetListener;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    List<Widget> widgets = [
      const AboutMe(),
      // ScreenResWidget(height: screenHeight, width: screenWidth),
      const Experience(),
      const SizedBox(height: 50),
      const Projects(),
    ];
    List<Widget> widgets2 = [
      appBar1366(context: context),
      const AboutMe(),
      const Experience(),
      // ScreenResWidget(height: screenHeight, width: screenWidth),
      const Projects(),
    ];
    // variables with screen height and width
    // double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: screenWidth > 1366
            ? Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromARGB(255, 7, 4, 19),
                      Color.fromARGB(255, 77, 84, 100),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: VerticalAppBar(
                          callback: (() => _updatePage(context
                              .read<SelectedAppBarButtonCubit>()
                              .state
                              .selectedButton)),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height,
                        child: ScrollablePositionedList.builder(
                          itemCount: widgets.length,
                          itemBuilder: (context, index) => widgets[index],
                          itemScrollController: itemScrollController,
                          scrollOffsetController: scrollOffsetController,
                          itemPositionsListener: itemPositionsListener,
                          scrollOffsetListener: scrollOffsetListener,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width < 1366
                    ? double.infinity
                    : MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromARGB(255, 7, 4, 19),
                      Color.fromARGB(255, 77, 84, 100),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: widgets2,
                  ),
                ),
              ),
      ),
    );
  }

  void _updatePage(int index) {
    isScrollingProgrammatically = true; // Set the flag to true before scrolling
    itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic)
        .then((_) {
      // After scrolling is done, reset the flag
      Future.delayed(const Duration(milliseconds: 300)).then((_) {
        isScrollingProgrammatically = false;
      });
    });
  }
}
