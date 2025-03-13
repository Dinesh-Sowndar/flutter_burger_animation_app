import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerQuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const BurgerQuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// Decrement Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              backgroundColor: Colors.white,
              minimumSize: const Size(40, 40),
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              elevation: 0,
            ),
            onPressed: quantity > 0 ? onDecrement : null, // Disable at 0
            child: Text(
              '-',
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// Quantity Display
          Text(
            quantity.toString(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),

          /// Increment Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              backgroundColor: Colors.white,
              minimumSize: const Size(40, 40),
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              elevation: 0,
            ),
            onPressed: quantity < 10 ? onIncrement : null, // Disable at 10
            child: Text(
              '+',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
