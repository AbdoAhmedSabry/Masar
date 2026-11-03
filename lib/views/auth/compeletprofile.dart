import 'package:elearning/widgets/Custome_button.dart';
import 'package:elearning/widgets/header.dart';
import 'package:elearning/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainHeader(
              height: size.height * 0.37,
              text: 'Welcome ',
              subtitle:
                  'Please Complete Your Profile\nto continue your journey and achieve your goals.',
            ),

            const SizedBox(height: 38),

            AuthTextField(
              hintText: 'phone number',
              prefixIcon: Icons.phone_android_outlined,
            ),

            const SizedBox(height: 18),
            AuthTextField(
              hintText: 'Dad phone number',
              prefixIcon: Icons.phone_android_outlined,
            ),

            const SizedBox(height: 18),
            AuthTextField(
              hintText: 'class or year',
              prefixIcon: Icons.class_outlined,
            ),

            const SizedBox(height: 18),
            CustomeButton(onTap: () {}, text: 'Confirm Profile'),

            const SizedBox(height: 38),
          ],
        ),
      ),
    );
  }
}
