import 'package:flutter/material.dart';
import 'package:elearning/widgets/Custome_button.dart';
import 'package:elearning/widgets/divider.dart';
import 'package:elearning/widgets/header.dart';
import 'package:elearning/widgets/social_button.dart';
import 'package:elearning/widgets/textfield.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
                height: size.height * 0.25,
                text: 'Create your account',
                subtitle: 'Join our community and start learning',
              ),

              // =========================
              // Form
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    AuthTextField(
                      hintText: 'Username',
                      prefixIcon: Icons.person_outline_rounded,
                    ),

                    const SizedBox(height: 18),

                    // Email
                    const AuthTextField(
                      hintText: 'Email address',
                      prefixIcon: Icons.mail_outline_rounded,
                    ),

                    const SizedBox(height: 18),

                    // Password
                    const AuthTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: Icons.visibility_outlined,
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      hintText: 'phone number',
                      prefixIcon: Icons.phone_android_outlined,
                    ),

                    const SizedBox(height: 12),

                    // =========================
                    // sign in Button
                    // =========================
                    CustomeButton(onTap: () {}, text: 'Sign in'),

                    const SizedBox(height: 38),

                    // =========================
                    // Divider
                    // =========================
                    Dividerw(),
                    const SizedBox(height: 28),

                    // =========================
                    // Social Login
                    // =========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          child: const Text(
                            'f',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        ),

                        const SizedBox(width: 20),

                        SocialButton(
                          child: const Text(
                            'G',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {},
                        ),

                        const SizedBox(width: 20),

                        SocialButton(
                          child: const Icon(Icons.apple, size: 30),
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 38),

                    // =========================
                    // Sign Up
                    // =========================
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF777777),
                        ),
                        children: [
                          const TextSpan(text: "Don't have an account?  "),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Sign in  →',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
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
