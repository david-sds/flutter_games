class SudokuCellState {
  int? number;
  bool isVisible;

  SudokuCellState({
    this.number,
    this.isVisible = true,
  });

  SudokuCellState copyWith({
    int? number,
    bool? isVisible,
  }) {
    return SudokuCellState(
      number: number ?? this.number,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  bool get isValid {
    final number_ = number;

    if (number_ == null) {
      return false;
    }

    return number_ > 0 && number_ < 10;
  }
}
