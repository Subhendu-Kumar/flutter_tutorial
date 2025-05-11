import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  State<PulsatingCircleAnimation> createState() =>
      _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation> {
  final double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pulsating Circle Animation')),
      body: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: size,
                spreadRadius: size / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
