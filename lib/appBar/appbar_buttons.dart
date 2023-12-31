import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/selected_app_bar_button/selected_app_bar_button_cubit.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback callback;
  final String title;
  final int index;
  final String route;

  const CustomButton({
    super.key,
    required this.title,
    required this.index,
    required this.route,
    required this.callback,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedAppBarButtonCubit, SelectedAppBarButtonState>(
      builder: (context, state) {
        return MouseRegion(
          onEnter: (event) {
            setState(() {
              context
                  .read<SelectedAppBarButtonCubit>()
                  .updateIsHovering(true, widget.index);
            });
          },
          onExit: (event) {
            setState(() {
              context
                  .read<SelectedAppBarButtonCubit>()
                  .updateIsHovering(false, widget.index);
            });
          },
          child: SizedBox(
            height: 35,
            width: 115,
            child: TextButton(
              onPressed: () {
                context
                    .read<SelectedAppBarButtonCubit>()
                    .updateSelectedButton(widget.index);
                widget.callback();
              },
              child: Text(
                widget.title,
                style: TextStyle(
                  color: state.selectedButton == widget.index
                      ? Colors.white
                      : Theme.of(context).colorScheme.tertiary,
                  fontFamily:
                      Theme.of(context).textTheme.displayLarge!.fontFamily,
                  fontSize: 14,
                  fontWeight: state.selectedButton == widget.index ||
                          state.isHovering[widget.index] == true
                      ? FontWeight.w600
                      : FontWeight.w300,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
