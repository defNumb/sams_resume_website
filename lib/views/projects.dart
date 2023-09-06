import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/hover_state/cubit/hover_cubit.dart';
import '../widgets/mobile_proj_container.dart';
import '../widgets/projects_containers.dart';

class Projects extends StatefulWidget {
  const Projects({
    super.key,
  });

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<String> appImages = [
    'assets/images/sign-in-page.png',
    'assets/images/store-page.png',
    'assets/images/home_page.png',
    'assets/images/pet-profile.png',
    'assets/images/categories-page.png'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoverCubit, HoverState>(
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          child: Column(
            children: [
              ProjectContainers(
                websiteName: 'Veterinaria Universo',
                description:
                    'Friendly and easy to use website for a veterinary clinic.',
                technologies: 'Flutter, Dart, HTML, CSS',
                websiteLink: 'https://veterinariauniverso.com/',
                imagePath: 'assets/images/vet_website.png',
                index: 2,
                isHovering: state.isHovering2,
              ),
              ProjectContainers(
                websiteName: 'Bolivia Pet Supply',
                description:
                    'Friendly and easy to use website for a pet supplier.',
                technologies: 'Flutter, Dart, HTML, CSS',
                websiteLink: 'https://boliviapetsupply.com/',
                imagePath: 'assets/images/bol_petsupply.png',
                index: 3,
                isHovering: state.isHovering2,
              ),
              // mobile project container
              MobileProjectContainer(
                  appName: 'Pet Market Bolivia App',
                  description:
                      '*COMING SOON*\nE-commerce app for a pet grooming and supply.',
                  technologies: 'Flutter, Dart, HTML, CSS, REST API',
                  imagesPath: appImages,
                  index: 4,
                  isHovering: state.isHovering2,
                  githubLink: 'https://github.com/defNumb/petmarket_bo_app/'),
            ],
          ),
        );
      },
    );
  }
}
