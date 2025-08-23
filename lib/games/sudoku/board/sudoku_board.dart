import 'package:flutter/material.dart';

class SudokuBoard extends StatelessWidget {
  const SudokuBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        9,
        (index) {
          return Row(
            children: List.generate(
              9,
              (index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    height: 40,
                    width: 40,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
