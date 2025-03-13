import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;

  const BurgerTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    /// Fixed: Defined types inside the widget
    final List<String> types = ['Black', 'White'];

    return Container(
      width: 160,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: types.map((type) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              backgroundColor: selectedType == type ? Colors.white : Colors.grey[200],
              minimumSize: const Size(70, 40),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 0,
            ),
            onPressed: () => onTypeSelected(type),
            child: Text(
              type,
              style: GoogleFonts.poppins(
                fontSize: selectedType == type ? 15 : 14,
                color: Colors.black,
                fontWeight: selectedType == type ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
