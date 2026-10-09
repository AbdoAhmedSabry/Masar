import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        height: 150,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            // =========================
            // Gray Shape
            // =========================
            Positioned(
              right: -35,
              bottom: -35,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),

            // =========================
            // Card Content
            // =========================
            Positioned(
              left: 16,
              top: 14,
              right: 90, // 🔥 أهم حاجة
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Title
                  const Text(
                    'Master the new iOS features and APIs',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Description
                  const Text(
                    'Join the most popular iPhone course and learn all about it.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 10,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // Arrow Button
            // =========================
            Positioned(
              right: 14,
              bottom: 14,
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ),

            // =========================
            // Graduation Icon
            // =========================
            Positioned(
              right: 25,
              top: 20,
              child: Icon(
                Icons.school_rounded,
                size: 45,
                color: const Color(0xFFBDBDBD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
