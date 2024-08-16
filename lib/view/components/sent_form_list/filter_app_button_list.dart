import 'package:flutter/material.dart';
import 'filter_approvement_button.dart';

class FilterApprovementButtonList extends StatelessWidget {
  final bool checkAccept;
  final bool checkWaiting;
  final bool checkReject;
  final Function(int) changeColorByIndex;

  const FilterApprovementButtonList({
    super.key,
    required this.checkAccept,
    required this.checkWaiting,
    required this.checkReject,
    required this.changeColorByIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FilterApprovementButton(
          activeColor: Colors.green,
          inactiveColor: Colors.grey.withOpacity(0.6),
          icon: Icons.check,
          isChecked: checkAccept,
          onPressed: () => changeColorByIndex(1),
        ),
        FilterApprovementButton(
          activeColor: Colors.yellow,
          inactiveColor: Colors.grey.withOpacity(0.6),
          icon: Icons.update,
          isChecked: checkWaiting,
          onPressed: () => changeColorByIndex(2),
        ),
        FilterApprovementButton(
          activeColor: Colors.red,
          inactiveColor: Colors.grey.withOpacity(0.6),
          icon: Icons.cancel,
          isChecked: checkReject,
          onPressed: () => changeColorByIndex(3),
        ),
      ],
    );
  }
}
