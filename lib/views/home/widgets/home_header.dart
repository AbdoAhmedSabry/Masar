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
      child: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(painter: AuthHeaderPainter()),
          ),

          const Positioned(
            right: 30,
            top: 65,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/abdp.jpg'),
              radius: 35,
            ),
          ),

          Positioned(
            left: 30,
            top: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: AppTextStyles.displayLarge.copyWith(letterSpacing: -1),
                ),
                const SizedBox(height: 2),
                Text(text, style: AppTextStyles.displayLarge),
                const SizedBox(height: 12),
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

class AuthHeaderPainter extends CustomPainter {
  const AuthHeaderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.headerDark
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.62, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.58);
    path.cubicTo(
      size.width * 0.82,
      size.height * 0.55,
      size.width * 0.74,
      size.height * 0.30,
      size.width * 0.62,
      0,
    );
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
