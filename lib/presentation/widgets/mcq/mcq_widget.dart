import 'package:dummy_app/core/themes.dart';
import 'package:flutter/material.dart';

class MCQWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(String) onOptionSelected;

  const MCQWidget({
    required this.question,
    required this.options,
    required this.onOptionSelected,
    super.key,
  });

  @override
  State<MCQWidget> createState() => _MCQWidgetState();
}

class _MCQWidgetState extends State<MCQWidget> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            widget.question,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor
            )
        ),

        const SizedBox(height: 12),
        ...widget.options.map((option) => RadioListTile<String>(
          title: Text(option, style: TextStyle(
            color: AppColors.mainTextColor,
            fontWeight: FontWeight.w700,
          ),
          ),
          value: option,
          activeColor: AppColors.mainColor,
          // tileColor: AppColors.inputBackground,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
            widget.onOptionSelected(value!);
          },
        )),
      ],
    );
  }
}
