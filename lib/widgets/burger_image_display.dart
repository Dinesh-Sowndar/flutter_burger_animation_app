import 'package:burger_animation_app/animations/bounce_animation_widget.dart';
import 'package:flutter/material.dart';

class BurgerImageDisplay extends StatelessWidget {
  final String selectedSize;
  final String selectedType;
  final double position;
  final PageController topImageController;
  final PageController bottomImageController;
  final AnimationController mediumPattyController;
  final AnimationController largePattyController;

  const BurgerImageDisplay({
    super.key,
    required this.selectedSize,
    required this.selectedType,
    required this.position,
    required this.topImageController,
    required this.bottomImageController,
    required this.mediumPattyController,
    required this.largePattyController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          /// Bottom Bun
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 145 + position,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 120,
              child: AnimatedBuilder(
                animation: bottomImageController,
                builder: (context, child) {
                  return PageView.builder(
                    itemCount: 2,
                    controller: bottomImageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      double value = 0.0;
                      if (bottomImageController.position.haveDimensions) {
                        value = index.toDouble() -
                            (bottomImageController.page ?? 0);
                        value = (value * 0.7).clamp(-1, 1);
                      }
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Transform.rotate(
                          angle: -value * 1.5,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: Image.asset(
                              "assets/images/${index == 0 ? "black" : "white"}_bun_bottom.png",
                              width: 220,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          /// Tomato & Patty Layer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 66 + position,
            right: 0,
            left: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/images/tomato_with_patty.png",
                  width: 220,
                ),
              ),
            ),
          ),

          /// Medium Patty Layer
          Positioned(
            top: 70 + (selectedSize == 'L' ? 50 : 0),
            right: 0,
            left: 0,
            child: (selectedSize == 'M' || selectedSize == 'L')
                ? Center(
                    child: BounceAnimationWidget(
                      controller: mediumPattyController,
                      child: Image.asset(
                        "assets/images/patty_left.png",
                        width: 220,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),

          /// Large Patty Layer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            top: 70,
            right: 0,
            left: 0,
            child: selectedSize == 'L'
                ? Center(
                    child: BounceAnimationWidget(
                      controller: largePattyController,
                      child: Image.asset(
                        "assets/images/patty_right.png",
                        width: 220,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),

          /// Top Bun
          SizedBox(
            height: 120,
            child: AnimatedBuilder(
              animation: topImageController,
              builder: (context, child) {
                return PageView.builder(
                  itemCount: 2,
                  controller: topImageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    double value = 0.0;
                    if (topImageController.position.haveDimensions) {
                      value = index.toDouble() -
                          (topImageController.page ?? 0);
                      value = (value * 0.7).clamp(-1, 1);
                    }
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Transform.rotate(
                          angle: value * 1.5,
                          child: Image.asset(
                            "assets/images/${index == 0 ? "black" : "white"}_bun_top.png",
                            width: 220,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
