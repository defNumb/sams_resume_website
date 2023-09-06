// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hover_state.dart';

class HoverCubit extends Cubit<HoverState> {
  HoverCubit() : super(HoverState.initial());

  void changeHover1(bool hovering, int index) {
    emit(state.copyWith(isHovering1: hovering, currentIndex: index));
  }

  void changeHover2(bool hovering, int index) {
    emit(state.copyWith(isHovering2: hovering, currentIndex: index));
  }

  void changeHover3(bool hovering, int index) {
    emit(state.copyWith(isHovering3: hovering, currentIndex: index));
  }
}
