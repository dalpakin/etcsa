import 'package:flutter/material.dart';

class AnimatedChoiceWidget extends StatelessWidget {
  final String choice1;
  final String choice2;
  final String selectedChoice;
  final ValueChanged<String> onChanged;

  const AnimatedChoiceWidget({
    super.key,
    required this.choice1,
    required this.choice2,
    required this.selectedChoice,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChoiceButton(choice1),
        _buildChoiceButton(choice2),
      ],
    );
  }

  Widget _buildChoiceButton(String choice) {
    bool isSelected = choice == selectedChoice;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(choice),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color.fromRGBO(39, 71, 96, 1) : Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: Center(
            child: Text(
              choice,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16.0,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
