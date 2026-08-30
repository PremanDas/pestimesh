import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'reset_password_screen.dart';
import 'role_selection_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Map<String, String> _profileData = {
    'Full Name': 'John',
    'Id Number': '12345678',
    'Contact Number': '012 345 6789',
    'Email': 'john@gmail.com',
    'Date Joined': 'January 11/11/2024',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1a1a3e), Color(0xff2d5f7f)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // Header
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Profile Picture
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Camera button
                  InkWell(
                    onTap: () {
                      // Implement profile photo change
                    },
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Profile Info
                  ..._profileData.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildInfoRow(
                        label: entry.key,
                        value: entry.value,
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 36,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const RoleSelectionScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.withOpacity(0.18),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: const Text(
                            'Log out',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.14),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: const Text(
                            'Reset password',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Pestimesh Logo
                  SvgPicture.asset(
                    'assets/icons/pestimesh-logo.svg',
                    width: 180,
                    height: 62.5,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
