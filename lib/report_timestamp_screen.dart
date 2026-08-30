import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportTimestampScreen extends StatefulWidget {
  const ReportTimestampScreen({
    super.key,
    required this.onBack,
    this.selectedImage,
    this.onImageSelected,
  });

  final VoidCallback onBack;
  final XFile? selectedImage;
  final ValueChanged<XFile?>? onImageSelected;

  @override
  State<ReportTimestampScreen> createState() => _ReportTimestampScreenState();
}

class _ReportTimestampScreenState extends State<ReportTimestampScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _technicianNameController = TextEditingController(
    text: 'Alex Wong',
  );
  final TextEditingController _designationController = TextEditingController(
    text: 'Senior Pest Specialist',
  );

  final GlobalKey<_SignaturePainterState> _signatureKey = GlobalKey();

  XFile? _selectedImage;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.selectedImage;
    final now = DateTime.now();
    _selectedDate = now;
    _selectedTime = TimeOfDay.fromDateTime(now);
  }

  @override
  void dispose() {
    _technicianNameController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final pickedFile = await _imagePicker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (!mounted || pickedFile == null) return;

    setState(() {
      _selectedImage = pickedFile;
    });
    widget.onImageSelected?.call(pickedFile);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String get _formattedDate {
    const monthNames = <int, String>{
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };
    return '${_selectedDate.day} ${monthNames[_selectedDate.month]} ${_selectedDate.year}';
  }

  String get _formattedTime {
    final hour = _selectedTime.hourOfPeriod == 0
        ? 12
        : _selectedTime.hourOfPeriod;
    final minute = _selectedTime.minute.toString().padLeft(2, '0');
    final period = _selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  void _submit() {
    final name = _technicianNameController.text.trim();
    final title = _designationController.text.trim();

    if (name.isEmpty || title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete technician details.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Report has been submitted')),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: widget.onBack,
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: const Color(0xFF1A1C2E),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'P',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'PESTIMESH',
                      style: TextStyle(
                        color: Color(0xFF1A1C2E),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'REPORT W/ TIME STAMP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F4F8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        if (_selectedImage == null)
                          const Icon(
                            Icons.camera_alt_outlined,
                            size: 52,
                            color: Color(0xFF8E93A3),
                          )
                        else
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(_selectedImage!.path),
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        const SizedBox(height: 12),
                        const Text(
                          'Capture / Upload Image',
                          style: TextStyle(
                            color: Color(0xFF1A1C2E),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
                                  onTap: _pickDate,
                                  child: _buildField(
                                    'STAMPING DATE',
                                    _formattedDate,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: InkWell(
                                  onTap: _pickTime,
                                  child: _buildField(
                                    'STAMPING TIME',
                                    _formattedTime,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'REPORT PREPARED BY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-SIGNATURE",
                        style: const TextStyle(
                          color: Color(0xFF1A1C2E),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        child: SignaturePad(key: _signatureKey),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () => _signatureKey.currentState?.clear(),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Clear'),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF1A1C2E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildEditableField(
                  label: 'TECHNICIAN NAME',
                  controller: _technicianNameController,
                ),
                const SizedBox(height: 12),
                _buildEditableField(
                  label: 'DESIGNATION / TITLE',
                  controller: _designationController,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: _submit,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF1D2D4E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1A1C2E),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFE9EEF2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1A1C2E),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1A1C2E),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFE9EEF2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 14),
            ),
            style: const TextStyle(
              color: Color(0xFF1A1C2E),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class SignaturePad extends StatefulWidget {
  const SignaturePad({super.key});

  @override
  State<SignaturePad> createState() => _SignaturePainterState();
}

class _SignaturePainterState extends State<SignaturePad> {
  final List<Offset?> _points = <Offset?>[];

  void clear() {
    setState(() {
      _points.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: GestureDetector(
        onPanStart: (details) {
          setState(() {
            _points.add(details.localPosition);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _points.add(details.localPosition);
          });
        },
        onPanEnd: (_) {
          setState(() {
            _points.add(null);
          });
        },
        child: CustomPaint(
          painter: SignaturePainter(points: _points),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter({required this.points});

  final List<Offset?> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A1C2E)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5;

    for (int i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];

      if (current != null && next != null) {
        canvas.drawLine(current, next, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
