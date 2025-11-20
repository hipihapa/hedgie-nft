import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final TabController controller;
  final int index;

  const CustomTab({
    super.key,
    required this.text,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final isSelected = controller.index == index;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}

