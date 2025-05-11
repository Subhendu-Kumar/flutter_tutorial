// import 'package:animation_tutorial/implicit_examples/animated_color_pallete.dart'; /* AnimatedColorPalette */
// import 'package:animation_tutorial/implicit_examples/animated_shopping_cart_button.dart'; /* ShoppingCartButton */
import 'package:animation_tutorial/implicit_examples/animated_tween_animation_builder_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PulsatingCircleAnimation(),
      // home: const ShoppingCartButton(),
      // home: const AnimatedColorPalette(),
    );
  }
}
