import 'package:elearning/widgets/Custome_button.dart';
import 'package:elearning/widgets/divider.dart';
import 'package:elearning/widgets/header.dart';
import 'package:elearning/widgets/social_button.dart';
import 'package:elearning/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // =========================
              // Header
              // =========================
              MainHeader(
                height: size.height * 0.30,
                text: 'Forgot password',
                subtitle: 'Enter your email address to reset your password',
              ),

              // =========================
              // Form
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Email
                    const AuthTextField(
                      hintText: 'Email address',
                      prefixIcon: Icons.mail_outline_rounded,
                    ),

                    const SizedBox(height: 40),

                    // =========================
                    // Forgot pass Button
                    // =========================
                    CustomeButton(onTap: () {}, text: 'verify email'),

                    const SizedBox(height: 38),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Back to login',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.2,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
