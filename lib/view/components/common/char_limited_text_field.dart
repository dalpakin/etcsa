import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CharacterLimitedTextField extends StatefulWidget {
  final TextEditingController controller;

  const CharacterLimitedTextField({super.key, required this.controller});

  @override
  _CharacterLimitedTextFieldState createState() =>
      _CharacterLimitedTextFieldState();
}

class _CharacterLimitedTextFieldState extends State<CharacterLimitedTextField> {
  final int _maxLength = 500;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateLength);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateLength);
    super.dispose();
  }

  void _updateLength() {
    setState(() {
      _currentLength = widget.controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: TextField(
            controller: widget.controller,
            maxLength: _maxLength,
            maxLines: null, // Allow for multi-line input
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: const OutlineInputBorder(),
              labelText: 'Metin girin',
              hintText: 'Buraya metin girin',
              counterText: '$_currentLength / $_maxLength', // Show character count
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(_maxLength),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}