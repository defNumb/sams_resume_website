// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'selected_app_bar_button_cubit.dart';

class SelectedAppBarButtonState extends Equatable {
  final int selectedButton;
  final CustomError error;

  const SelectedAppBarButtonState({
    required this.selectedButton,
    required this.error,
  });

  // initial state
  factory SelectedAppBarButtonState.initial() {
    return 
      const SelectedAppBarButtonState(
        selectedButton: 0,
        error: CustomError(),
      );
  }
  
  @override
  List<Object> get props => [selectedButton, error];

  SelectedAppBarButtonState copyWith({
    int? selectedButton,
    CustomError? error,
  }) {
    return SelectedAppBarButtonState(
      selectedButton: selectedButton ?? this.selectedButton,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;
}
