// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';

part 'selected_app_bar_button_state.dart';

class SelectedAppBarButtonCubit extends Cubit<SelectedAppBarButtonState> {
  SelectedAppBarButtonCubit() : super(SelectedAppBarButtonState.initial());

  void updateSelectedButton(int selectedButton) {
    try {
      emit(
        state.copyWith(selectedButton: selectedButton, error: null),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          selectedButton: 0,
          error: e,
        ),
      );
    }
  }

  // update hovering
  void updateIsHovering(bool isHovering, int hoveredIndex) {
    try {
      emit(
        state.copyWith(
          isHovering: {hoveredIndex: isHovering},
          error: null,
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          isHovering: {state.selectedButton: false},
          error: e,
        ),
      );
    }
  }
}
