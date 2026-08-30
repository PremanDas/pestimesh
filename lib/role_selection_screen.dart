import 'package:flutter/material.dart';

import 'main.dart';

enum UserRole { technician, manager }

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  UserRole _selectedRole = UserRole.technician;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'PESTIMESH',
                    style: TextStyle(
                      color: Color(0xFF1A1C2E),
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select role',
                  style: TextStyle(
                    color: Color(0xFF1A1C2E),
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              _buildRoleCard(
                role: UserRole.technician,
                title: 'Technician',
                subtitle: 'Field service and report workflow',
                icon: Icons.engineering_outlined,
              ),
              const SizedBox(height: 14),
              _buildRoleCard(
                role: UserRole.manager,
                title: 'Manager',
                subtitle: 'Operations overview and approvals',
                icon: Icons.business_center_outlined,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(role: _selectedRole),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1D2D4E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required UserRole role,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = _selectedRole == role;

    return InkWell(
      onTap: () => setState(() => _selectedRole = role),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE7ECF6) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? const Color(0xFF1D2D4E) : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF1D2D4E) : const Color(0xFFE9EEF2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : const Color(0xFF1A1C2E),
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1A1C2E),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF5F697C),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? const Color(0xFF1D2D4E) : const Color(0xFF8E93A3),
            ),
          ],
        ),
      ),
    );
  }
}
