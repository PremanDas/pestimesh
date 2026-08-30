import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Positioned(
              //   top: -80,
              //   left: -100,
              //   child: Container(
              //     width: 300,
              //     height: 300,
              //     decoration: BoxDecoration(
              //       color: Colors.deepPurple.withOpacity(0.08),
              //       borderRadius: BorderRadius.circular(180),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   bottom: -120,
              //   right: -60,
              //   child: Container(
              //     width: 380,
              //     height: 380,
              //     decoration: BoxDecoration(
              //       color: Colors.brown,
              //       borderRadius: BorderRadius.circular(220),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 8, bottom: 24),
                        children: [
                          _buildGradientCard(
                            context,
                            title: 'Notice:',
                            subtitle: '[information]',
                            colors: [Color(0xFF0E0B3A), Color(0xFF2F2BE6)],
                          ),
                          const SizedBox(height: 20),
                          _buildGradientCard(
                            context,
                            title: 'Announcement:',
                            subtitle: '[information]',
                            colors: [Color(0xFF0F0802), Color(0xFFD08B07)],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Logo above the bottom tab bar
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                    'assets/icons/pestimesh-logo.svg',
                    width: 180,
                    height: 62.5,
                    semanticsLabel: 'Pestimesh logo',
                  ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 16.0),
                //   child: SvgPicture.asset(
                //     'assets/icons/pestimesh-logo.svg',
                //     width: 140,
                //     height: 52,
                //     semanticsLabel: 'Pestimesh logo',
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientCard(BuildContext context,
      {required String title,
      required String subtitle,
      required List<Color> colors}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: SvgPicture.asset(
                        'assets/icons/icon-right-arrow.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
