import 'package:elearning/views/home/widgets/course_card.dart';
import 'package:elearning/views/home/widgets/home_banner.dart';
import 'package:elearning/views/home/widgets/home_header.dart';
import 'package:elearning/views/home/widgets/home_search_bar.dart';
import 'package:elearning/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(
            height: size.height * 0.22,
            text: 'AbdElrahman',
            subtitle: 'Keep Learning to Improve Yourself',
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HomeSearchBar(hintText: 'Search', prefixIcon: Icons.search),
          ),
          HomeBanner(),
          Text(
            "Popular Courses",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          CourseCardWidget(
            courseImageUrl: 'assets/images/flu.jpg',
            title: 'UI/UX Design',
            description: 'Learn UI/UX Design',
            instructorName: 'John Doe',
            instructorImageUrl:"assets/images/abdp.jpg",
          ),
        ],
      ),
    );
  }
}
