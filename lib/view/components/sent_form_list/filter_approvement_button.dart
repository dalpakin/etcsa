import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class FilterApprovementButton extends StatelessWidget {
  final Color activeColor;
  final Color inactiveColor;
  final IconData icon;
  final bool isChecked;
  final VoidCallback onPressed;

  const FilterApprovementButton({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    required this.icon,
    required this.isChecked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        color: isChecked ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 25.0,
            color: isChecked ? Colors.white : activeColor,
          ),
        ),
      ),
    );
  }
}
