import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DraftsScreen extends StatelessWidget {
  const DraftsScreen({super.key});

  static const List<_DraftItem> _items = [
    _DraftItem(
      ref: 'RPC01',
      title: 'Residential Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: 'Draft',
    ),
    _DraftItem(
      ref: 'CPC12',
      title: 'Commercial Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: 'Draft',
    ),
    _DraftItem(
      ref: 'OPC32',
      title: 'Office Pest Control',
      date: '11/11/26',
      time: '00:00',
      status: 'Draft',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: const Color(0xFF1A1C2E),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Drafts',
                        style: TextStyle(
                          color: Color(0xFF1A1C2E),
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      _HeaderButton(
                        assetPath: 'assets/icons/icon-filter.svg',
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      _HeaderButton(
                        assetPath: 'assets/icons/icon-sort.svg',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFFE8EAF0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Ref: ${item.ref}',
                                style: const TextStyle(
                                  color: Color(0xFF7A7D8B),
                                  fontSize: 13,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE6E7EB),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  item.status,
                                  style: const TextStyle(
                                    color: Color(0xFF505A67),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.title,
                            style: const TextStyle(
                              color: Color(0xFF1A1C2E),
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/icon-calendar.svg',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                item.date,
                                style: const TextStyle(
                                  color: Color(0xFF7A7D8B),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 16),
                              SvgPicture.asset(
                                'assets/icons/icon-clock.svg',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                item.time,
                                style: const TextStyle(
                                  color: Color(0xFF7A7D8B),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Divider(
                            color: const Color(0xFFE8EAF0),
                            thickness: 1,
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'View full report',
                                  style: TextStyle(
                                    color: const Color(0xFF1A1C2E).withOpacity(0.8),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF1C2E8A),
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
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

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.assetPath,
    required this.onTap,
  });

  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE3E6EC)),
          ),
          child: Center(
            child: SvgPicture.asset(
              assetPath,
              width: 18,
              height: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _DraftItem {
  const _DraftItem({
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
  final String status;
}
