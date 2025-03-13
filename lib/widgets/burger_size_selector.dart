import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerSizeSelector extends StatelessWidget {
  final String selectedSize;
  final Function(String) onSizeSelected;

  const BurgerSizeSelector({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    /// Fixed: Defined sizes inside the widget
    final List<String> sizes = ['S', 'M', 'L'];

    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: sizes.map((size) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              backgroundColor: selectedSize == size ? Colors.white : Colors.grey[200],
              minimumSize: const Size(40, 40),
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              elevation: 0,
            ),
            onPressed: () => onSizeSelected(size),
            child: Text(
              size,
              style: GoogleFonts.poppins(
                fontSize: selectedSize == size ? 15 : 14,
                color: Colors.black,
                fontWeight: selectedSize == size ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
