// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hover_cubit.dart';

class HoverState extends Equatable {
  final int currentIndex;
  final bool isHovering1;
  final bool isHovering2;
  final bool isHovering3;

  const HoverState({
    required this.currentIndex,
    required this.isHovering1,
    required this.isHovering2,
    required this.isHovering3,
  });

  // initial state
  factory HoverState.initial() => const HoverState(
        isHovering1: true,
        isHovering2: true,
        isHovering3: true,
        currentIndex: -1,
      );

  @override
  List<Object> get props => [currentIndex, isHovering1, isHovering2];

  HoverState copyWith({
    bool? isHovering1,
    bool? isHovering2,
    bool? isHovering3,
    int? currentIndex,
  }) {
    return HoverState(
      isHovering1: isHovering1 ?? this.isHovering1,
      isHovering2: isHovering2 ?? this.isHovering2,
      isHovering3: isHovering3 ?? this.isHovering3,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  bool get stringify => true;
}
