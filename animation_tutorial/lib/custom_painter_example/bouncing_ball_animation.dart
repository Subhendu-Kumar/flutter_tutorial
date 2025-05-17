import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bounceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    bounceAnimation = Tween<double>(
      begin: 50.0,
      end: 250.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: bounceAnimation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPaint(
                  size: const Size(double.infinity, 300),
                  painter: BouncingBallPainter(
                    ballRadius: 20,
                    ballYPosition: bounceAnimation.value,
                    ballColor: Colors.blue,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double ballRadius;
  final double ballYPosition;
  final Color ballColor;

  BouncingBallPainter({
    required this.ballRadius,
    required this.ballYPosition,
    required this.ballColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = ballColor
          ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, ballYPosition), ballRadius, paint);
  }

  @override
  bool shouldRepaint(covariant BouncingBallPainter oldDelegate) {
    return oldDelegate.ballYPosition != ballYPosition ||
        oldDelegate.ballRadius != ballRadius ||
        oldDelegate.ballColor != ballColor;
  }
}
