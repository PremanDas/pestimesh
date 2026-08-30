import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'documentation.dart';
import 'history.dart';
import 'home.dart';
import 'manager_dashboard_screen.dart';
import 'profile.dart';
import 'role_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pestimesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const RoleSelectionScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.role = UserRole.technician});

  final UserRole role;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.role == UserRole.manager) {
      return const ManagerDashboardScreen();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildContent(_selectedIndex),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffa6a6a6).withAlpha(125),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.12),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavIcon(0, 'assets/icons/icon-home.svg', 'Home'),
                      _buildNavIcon(1, 'assets/icons/icon-documents.svg',
                          'Documents'),
                      _buildNavIcon(
                          2, 'assets/icons/icon-history.svg', 'History'),
                      _buildNavIcon(3, 'assets/icons/icon-user.svg', 'Profile'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 1:
        return DocumentationScreen(
          onNavigateToTab: _onNavItemTapped,
        );
      case 0:
        return const HomeScreen();
      case 2:
        return const HistoryScreen();
      case 3:
        return const ProfileScreen();
      default:
        return _buildPlaceholder('Home');
    }
  }

  Widget _buildPlaceholder(String title) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildNavIcon(int index, String iconPath, String label) {
    final isSelected = _selectedIndex == index;
    return Tooltip(
      message: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onNavItemTapped(index),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Color(0xff545454),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
