import 'package:burger_animation_app/pages/burger_details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BurgerAnimationApp());
}

class BurgerAnimationApp extends StatelessWidget {
  const BurgerAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BurgerDetailsPage(),
    );
  }
}
