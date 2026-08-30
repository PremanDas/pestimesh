import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum HistoryStatus { draft, submitted, removed }

class HistoryItem {
  const HistoryItem({
    required this.ref,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  final String ref;
  final String title;
  final String date;
  final String time;
  final HistoryStatus status;
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const _items = [
    HistoryItem(
      ref: 'RPC01',
      title: 'Residential Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: HistoryStatus.draft,
    ),
    HistoryItem(
      ref: 'CPC01',
      title: 'Commercial Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: HistoryStatus.submitted,
    ),
    HistoryItem(
      ref: 'OPC01',
      title: 'Office Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: HistoryStatus.removed,
    ),
    HistoryItem(
      ref: 'RPC01',
      title: 'Residential Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: HistoryStatus.draft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'History',
                      style: TextStyle(
                        color: Color(0xFF1A1C2E),
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _HeaderIconButton(
                    assetPath: 'assets/icons/icon-filter.svg',
                    semanticsLabel: 'Filter',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  _HeaderIconButton(
                    assetPath: 'assets/icons/icon-sort.svg',
                    semanticsLabel: 'Sort',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: _items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _HistoryCard(item: _items[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.assetPath,
    required this.semanticsLabel,
    required this.onTap,
  });

  final String assetPath;
  final String semanticsLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD1D5DB)),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            assetPath,
            width: 18,
            height: 18,
            semanticsLabel: semanticsLabel,
          ),
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.item});

  final HistoryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ref: ${item.ref}',
                        style: const TextStyle(
                          color: Color(0xFF7A7D8B),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _StatusBadge(status: item.status),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Color(0xFF1A1C2E),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icon-calendar.svg',
                      width: 14,
                      height: 14,
                      semanticsLabel: 'Date',
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.date,
                      style: const TextStyle(
                        color: Color(0xFF7A7D8B),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset(
                      'assets/icons/icon-clock.svg',
                      width: 14,
                      height: 14,
                      semanticsLabel: 'Time',
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.time,
                      style: const TextStyle(
                        color: Color(0xFF7A7D8B),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'View full report',
                        style: TextStyle(
                          color: Color(0xFF1800AD),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/icon-right-arrow.svg',
                      width: 20,
                      height: 20,
                      semanticsLabel: 'View full report',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final HistoryStatus status;

  @override
  Widget build(BuildContext context) {
    final Color background;
    final Color foreground;
    final String label;

    switch (status) {
      case HistoryStatus.draft:
        background = const Color(0xFFF1F5F9);
        foreground = const Color(0xFF334155);
        label = 'Draft';
      case HistoryStatus.submitted:
        background = const Color(0xFFE8F5E9);
        foreground = const Color(0xFF2E7D32);
        label = 'Submitted';
      case HistoryStatus.removed:
        background = const Color(0xFFFFEBEE);
        foreground = const Color(0xFFC62828);
        label = 'Removed';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
