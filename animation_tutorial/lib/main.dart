// import 'package:animation_tutorial/implicit_examples/animated_color_pallete.dart'; /* AnimatedColorPalette */
// import 'package:animation_tutorial/implicit_examples/animated_shopping_cart_button.dart'; /* ShoppingCartButton */
// import 'package:animation_tutorial/explicit_examples/login_animation.dart'; /* LoginScreenAnimation */
// import 'package:animation_tutorial/implicit_examples/animated_tween_animation_builder_example.dart'; /* PulsatingCircleAnimation */
// import 'package:animation_tutorial/explicit_examples/list_animation.dart'; /* ListAnimation */
// import 'package:animation_tutorial/explicit_examples/loading_animation.dart'; /* RadialProgressAnimation */
// import 'package:animation_tutorial/page_route_builder_animation/splash_animation.dart'; /* SplashAnimation */
import 'package:animation_tutorial/custom_painter_example/bouncing_ball_animation.dart';
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
      debugShowCheckedModeBanner: false,
      home: const BouncingBallAnimation(),
      // home: const SplashAnimation(),
      // home: const RadialProgressAnimation(progress: 0.65, color: Colors.pink),
      // home: const ListAnimation(),
      // home: const LoginScreenAnimation(),
      // home: const PulsatingCircleAnimation(),
      // home: const ShoppingCartButton(),
      // home: const AnimatedColorPalette(),
    );
  }
}
