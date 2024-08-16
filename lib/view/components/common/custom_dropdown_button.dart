import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final String? hint;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemToString;
  final int Function(T) itemToId;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemToString,
    required this.itemToId,
    this.hint,
  });

  @override
  _CustomDropdownButtonState<T> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromRGBO(39, 71, 96, 1)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: widget.value,
          hint: widget.hint != null ? Text(widget.hint!) : null,
          isExpanded: true,
          items: widget.items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(widget.itemToString(item)),
            );
          }).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
