import 'package:elearning/core/constants/app_colors.dart';
import 'package:elearning/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.height,
    required this.text,
    required this.subtitle,
  });

  final double height;
  final String text;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          // Background painter
          Positioned.fill(child: CustomPaint(painter: HomeHeaderPainter())),

          // User Avatar
          Positioned(
            top: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage("assets/images/abdp.jpg"),
              ),
            ),
          ),
          // Header content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.school_rounded,
                      size: 52,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        text,
                        style: AppTextStyles.displayLarge.copyWith(
                          fontSize: 34,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHeaderPainter extends CustomPainter {
  const HomeHeaderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.headerDark
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(size.width * 0.62, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.62);

    path.cubicTo(
      size.width * 0.82,
      size.height * 0.60,
      size.width * 0.70,
      size.height * 0.43,
      size.width * 0.63,
      size.height * 0.25,
    );

    path.cubicTo(
      size.width * 0.59,
      size.height * 0.15,
      size.width * 0.56,
      size.height * 0.07,
      size.width * 0.53,
      0,
    );

    path.close();

    canvas.drawPath(path, paint);
    path.close();
    canvas.drawPath(path, paint);

    final linePaint = Paint()
      ..color = AppColors.headerStroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final decorativePath = Path();
    decorativePath.moveTo(size.width * 0.59, 0);
    decorativePath.cubicTo(
      size.width * 0.63,
      size.height * 0.12,
      size.width * 0.72,
      size.height * 0.24,
      size.width * 0.80,
      size.height * 0.30,
    );
    canvas.drawPath(decorativePath, linePaint);

    final circlePaint = Paint()
      ..color = AppColors.headerCircle
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.32),
      10,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
