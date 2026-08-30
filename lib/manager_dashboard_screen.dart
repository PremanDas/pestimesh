import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'announcement_notice_screen.dart';
import 'documentation.dart';
import 'history.dart';
import 'home.dart';
import 'profile.dart';
import 'submissions.dart';
import 'technician_list_screen.dart';

class ManagerDashboardScreen extends StatefulWidget {
  const ManagerDashboardScreen({super.key});

  @override
  State<ManagerDashboardScreen> createState() => _ManagerDashboardScreenState();
}

class _ManagerDashboardScreenState extends State<ManagerDashboardScreen> {
  bool _showAllTechnicians = false;

  final List<Map<String, dynamic>> _technicians = List.generate(
    10,
    (index) {
      final bool isActive = index % 2 == 0;
      return {
        'name': 'Technician name',
        'id': 'Technician id',
        'active': isActive,
      };
    },
  );

  final List<String> _actions = [
    'Technician List',
    'Submissions',
    'Create New',
    'History',
    'Account',
    'Notice',
    'Announcement',
  ];

  @override
  Widget build(BuildContext context) {
    final visibleTechnicians = _showAllTechnicians
        ? _technicians
        : _technicians.take(5).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: SvgPicture.asset(
            'assets/icons/pestimesh-logo.svg',
            width: 180,
            height: 62.5,
            semanticsLabel: 'Pestimesh logo',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1D2D4E),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Active Technicians',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'ID No.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'Status',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...visibleTechnicians.map((tech) {
                      final isActive = tech['active'] as bool;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                tech['name'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                tech['id'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: isActive ? Colors.green : Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 8),
                    if (_technicians.length > 5)
                      InkWell(
                        onTap: () {
                          setState(() {
                            _showAllTechnicians = !_showAllTechnicians;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _showAllTechnicians ? 'View less' : 'View more',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.62,
                children: _actions.map((label) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Widget screen;
                        switch (label) {
                          case 'Technician List':
                            screen = const TechnicianListScreen();
                            break;
                          case 'Submissions':
                            screen = const SubmissionsScreen();
                            break;
                          case 'Create New':
                            screen = const CreateNewSubmissionFlow();
                            break;
                          case 'History':
                            screen = const HistoryScreen();
                            break;
                          case 'Account':
                            screen = const ProfileScreen();
                            break;
                          case 'Notice':
                            screen = const AnnouncementNoticeScreen(
                              type: AnnouncementNoticeType.notice,
                            );
                            break;
                          case 'Announcement':
                            screen = const AnnouncementNoticeScreen(
                              type: AnnouncementNoticeType.announcement,
                            );
                            break;
                          default:
                            screen = const HomeScreen();
                            break;
                        }

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => screen),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D2D4E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
