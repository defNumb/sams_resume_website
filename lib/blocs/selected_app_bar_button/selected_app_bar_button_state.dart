// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'selected_app_bar_button_cubit.dart';

class SelectedAppBarButtonState extends Equatable {
  final int selectedButton;
  final CustomError error;
  final Map<int, bool> isHovering;

  const SelectedAppBarButtonState({
    required this.selectedButton,
    required this.isHovering,
    required this.error,
  });

  // initial state
  factory SelectedAppBarButtonState.initial() {
    return const SelectedAppBarButtonState(
      selectedButton: 0,
      error: CustomError(),
      isHovering: {},
    );
  }

  @override
  List<Object> get props => [selectedButton, error, isHovering];

  SelectedAppBarButtonState copyWith({
    int? selectedButton,
    CustomError? error,
    Map<int, bool>? isHovering,
  }) {
    return SelectedAppBarButtonState(
      selectedButton: selectedButton ?? this.selectedButton,
      error: error ?? this.error,
      isHovering: isHovering ?? this.isHovering,
    );
  }

  @override
  bool get stringify => true;
}
