import 'package:flutter/material.dart';

class AirplaneAnimation extends StatefulWidget {
  const AirplaneAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AirplaneAnimationState createState() => _AirplaneAnimationState();
}

class _AirplaneAnimationState extends State<AirplaneAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    _animation = Tween<double>(
      begin: 0.0, // Initial position (left)
      end: 1.0, // Final position (right)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear, // Linear curve for straight line animation
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // Reverse animation when completed
      } else if (status == AnimationStatus.dismissed) {
        _controller
            .forward(); // Start animation again when dismissed (reached start)
      }
    });

    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background bar
        Container(
          color: Colors.white,
          height: 50, // Height of the bar
          width: 100, // Full width
          child: CustomPaint(
                painter: DottedLinePainter(),
              ),
        ),
        // Airplane
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              left: _animation.value * 80,
              top: 15, // Adjust to vertically center the airplane in the bar
              child: const Icon(Icons.airplanemode_active,
                  color: Color(0xFF3E84A8), size: 16),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height / 2), Offset(startX + dashWidth, size.height / 2), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
