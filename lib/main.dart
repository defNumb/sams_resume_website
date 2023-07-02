import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sams_website/constants/theme_const.dart';
import 'package:sams_website/home_page.dart';
import 'blocs/hover_state/cubit/hover_cubit.dart';
import 'blocs/selected_app_bar_button/selected_app_bar_button_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // selectedAppBarButtonCubitProvider,
        BlocProvider<SelectedAppBarButtonCubit>(
          create: (context) => SelectedAppBarButtonCubit()),
        // hoverCubitProvider,
        BlocProvider<HoverCubit>(
          create: (context) => HoverCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sam\'s website',
        theme: themeData(context),
        home: const HomePage(),
      ),
    );
  }
}
