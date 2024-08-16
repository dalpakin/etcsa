import 'package:flutter/material.dart';

class CheckBoxItem<T> {
  final T value;
  final String label;
  bool isSelected;

  CheckBoxItem({
    required this.value,
    required this.label,
    this.isSelected = false,
  });
}

class CustomCheckBoxGrid<T> extends StatelessWidget {
  final List<CheckBoxItem<T>> items;
  final ValueChanged<T> onItemChanged;

  const CustomCheckBoxGrid({
    super.key,
    required this.items,
    required this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Ensure at least 2 items per row
        childAspectRatio: 3,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CheckboxListTile(
          value: item.isSelected,
          title: Text(item.label),
          onChanged: (bool? value) {
            onItemChanged(item.value);
          },
        );
      },
    );
  }
}
