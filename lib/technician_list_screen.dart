import 'package:flutter/material.dart';

class TechnicianListScreen extends StatelessWidget {
  const TechnicianListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final technicians = [
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
      {'name': 'Technician name', 'id': 'Technician id', 'dateJoined': 'dd/mm/yyyy'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF1A1C2E)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Technician List',
          style: TextStyle(
            color: Color(0xFF1A1C2E),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: ListView.separated(
            itemCount: technicians.length,
            separatorBuilder: (_, __) => const Divider(
              color: Color(0xFFE8EAF0),
              thickness: 1,
              height: 20,
            ),
            itemBuilder: (context, index) {
              final tech = technicians[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tech['name'] as String,
                      style: const TextStyle(
                        color: Color(0xFF1A1C2E),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tech['id'] as String,
                      style: const TextStyle(
                        color: Color(0xFF1A1C2E),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tech['dateJoined'] as String,
                      style: const TextStyle(
                        color: Color(0xFF8E93A3),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
