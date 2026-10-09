import 'package:flutter/material.dart';

class Dividerw extends StatelessWidget {
  const Dividerw({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFD0D0D0), thickness: 1)),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const Expanded(child: Divider(color: Color(0xFFD0D0D0), thickness: 1)),
      ],
    );
  }
}
