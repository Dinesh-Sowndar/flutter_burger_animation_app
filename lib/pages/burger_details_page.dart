import 'package:burger_animation_app/widgets/burger_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/burger_size_selector.dart';
import '../widgets/burger_type_selector.dart';
import '../widgets/burger_image_display.dart';
import '../widgets/add_to_cart_button.dart';

class BurgerDetailsPage extends StatefulWidget {
  const BurgerDetailsPage({super.key});

  @override
  _BurgerDetailsPageState createState() => _BurgerDetailsPageState();
}

class _BurgerDetailsPageState extends State<BurgerDetailsPage>
    with TickerProviderStateMixin {
  String selectedSize = 'S';
  String selectedType = 'White';
  int quantity = 0;
  double position = 0.0;

  late PageController _bottomImageSlideController;
  late PageController _topImageSlideController;
  late AnimationController _mAnimationController;
  late AnimationController _lAnimationController;

  @override
  void initState() {
    super.initState();
    _topImageSlideController = PageController(initialPage: 1);
    _bottomImageSlideController = PageController(initialPage: 1);
    _mAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _lAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _topImageSlideController.dispose();
    _bottomImageSlideController.dispose();
    _mAnimationController.dispose();
    _lAnimationController.dispose();
    super.dispose();
  }

  void triggerBounce() {
    if (selectedSize == 'M') {
      _mAnimationController.forward(from: 0.0);
    }
    if (selectedSize == 'L') {
      _mAnimationController.forward(from: 0.0);
      _lAnimationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cheeseburger",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined), onPressed: () {}),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),

              /// Size & Type Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BurgerSizeSelector(
                    selectedSize: selectedSize,
                    onSizeSelected: (size) {
                      setState(() {
                        position = size == 'S'
                            ? 0
                            : size == 'M'
                                ? 50
                                : 100;
                        selectedSize = size;
                      });
                      triggerBounce();
                    },
                  ),
                  BurgerTypeSelector(
                    selectedType: selectedType,
                    onTypeSelected: (type) {
                      setState(() {
                        selectedType = type;
                      });
                      _topImageSlideController.animateToPage(
                        type == 'Black' ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                      _bottomImageSlideController.animateToPage(
                        type == 'Black' ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 50),

              /// Burger Image Display
              BurgerImageDisplay(
                selectedSize: selectedSize,
                selectedType: selectedType,
                position: position,
                topImageController: _topImageSlideController,
                bottomImageController: _bottomImageSlideController,
                mediumPattyController: _mAnimationController,
                largePattyController: _lAnimationController,
              ),

              const SizedBox(height: 30),

              BurgerQuantitySelector(
                quantity: quantity,
                onIncrement: () {
                  if (quantity < 10) {
                    setState(() {
                      quantity++;
                    });
                  }
                },
                onDecrement: () {
                  if (quantity > 0) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),

              const SizedBox(height: 30),

              /// Add to Cart Button
              AddToCartButton(
                price: 10.40, // Replace with dynamic price if needed
                onPressed: () {
                  // Implement your add-to-cart logic here
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
