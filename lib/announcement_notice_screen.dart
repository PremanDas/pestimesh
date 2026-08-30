import 'package:flutter/material.dart';

enum AnnouncementNoticeType { announcement, notice }

class AnnouncementNoticeScreen extends StatefulWidget {
  const AnnouncementNoticeScreen({
    super.key,
    required this.type,
  });

  final AnnouncementNoticeType type;

  @override
  State<AnnouncementNoticeScreen> createState() => _AnnouncementNoticeScreenState();
}

class _AnnouncementNoticeScreenState extends State<AnnouncementNoticeScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _history = [
    '[most recent announcement]',
    '[second recent announcement]',
    '[third recent announcement]',
    '[fourth recent announcement]',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _title {
    switch (widget.type) {
      case AnnouncementNoticeType.announcement:
        return 'Announcement';
      case AnnouncementNoticeType.notice:
        return 'Notice';
    }
  }

  String get _helperText {
    switch (widget.type) {
      case AnnouncementNoticeType.announcement:
        return 'New Announcement';
      case AnnouncementNoticeType.notice:
        return 'New Notice';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: const Color(0xFF1D2D4E),
                  iconSize: 32,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                  _helperText,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _controller,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: '[type new ${_title.toLowerCase()}]',
                    hintStyle: const TextStyle(
                      color: Color(0xFF7A7D8B),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: const Color(0xFF1A1C2E).withOpacity(0.18),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: const Color(0xFF1A1C2E).withOpacity(0.18),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: const Color(0xFF1D2D4E).withOpacity(0.6),
                        width: 1.2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(14),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1D2D4E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: _history.length,
                  separatorBuilder: (_, __) => const Divider(
                    color: Color(0xFF1A1C2E),
                    thickness: 1,
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        _history[index],
                        style: const TextStyle(
                          color: Color(0xFF1A1C2E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
