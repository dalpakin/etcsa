import 'package:flutter/material.dart';

class CustomRadioButtonList<T> extends StatelessWidget {
  final List<RadioButtonItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;

  const CustomRadioButtonList({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return RadioListTile<T>(
          value: item.value,
          groupValue: selectedValue,
          title: Text(item.label),
          onChanged: onChanged,
        );
      }).toList(),
    );
  }
}

class RadioButtonItem<T> {
  final T value;
  final String label;

  RadioButtonItem({
    required this.value,
    required this.label,
  });
}
