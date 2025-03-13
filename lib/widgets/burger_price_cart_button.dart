import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPriceCartButton extends StatelessWidget {
  final double price;
  final VoidCallback onAddToCart;

  const BurgerPriceCartButton({
    Key? key,
    required this.price,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                elevation: 0,
              ),
              onPressed: onAddToCart,
              child: Text("Add to Cart", style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            child: Center(
              child: Text("\$$price", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
