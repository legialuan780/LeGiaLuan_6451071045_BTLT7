import 'package:flutter/material.dart';
import '../style/app_text_style.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: AppTextStyle.label,
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyle.value,
            ),
          ),
        ],
      ),
    );
  }
}