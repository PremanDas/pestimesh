import 'package:flutter/material.dart';

class ServiceReportFormScreen extends StatefulWidget {
  const ServiceReportFormScreen({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  State<ServiceReportFormScreen> createState() => _ServiceReportFormScreenState();
}

class _ServiceReportFormScreenState extends State<ServiceReportFormScreen> {
  late TextEditingController _reportNoController;
  late TextEditingController _dateController;
  late TextEditingController _customerNameController;
  late TextEditingController _billingAddressController;
  late TextEditingController _serviceAddressController;
  late TextEditingController _pestCoverageController;
  late TextEditingController _serviceTypeController;
  late TextEditingController _frequencyController;
  late TextEditingController _techniciansController;
  late TextEditingController _treatmentMethodController;
  late TextEditingController _pesticideUsedController;
  late TextEditingController _technicianRemarksController;

  @override
  void initState() {
    super.initState();
    _reportNoController = TextEditingController(text: 'PM-2026-8941');
    _dateController = TextEditingController(text: '24 Oct 2026');
    _customerNameController = TextEditingController(text: 'Buildcon Synergy Pte Ltd');
    _billingAddressController = TextEditingController(text: '12 Kaki Bukit Industrial Trace, Singapore 4178...');
    _serviceAddressController = TextEditingController(text: '25 Kaki Bukit Road 4, Synergy @ KB, Singapore...');
    _pestCoverageController = TextEditingController(text: 'Subterranean Termites, Common Ants, Rodents');
    _serviceTypeController = TextEditingController(text: 'Commercial Preventive Maintenance');
    _frequencyController = TextEditingController(text: 'Monthly');
    _techniciansController = TextEditingController(text: 'Alex Wong, Tan AH');
    _treatmentMethodController = TextEditingController(text: 'Residual spraying applied to perimeter. Bait stations inspected and replaced. Dusting applied in structural crevices.');
    _pesticideUsedController = TextEditingController(text: 'Agenda 25EC (Fipronil 2.5% w/w)');
    _technicianRemarksController = TextEditingController(text: 'No active termite activity spotted this month. Ant traps remain effective.');
  }

  @override
  void dispose() {
    _reportNoController.dispose();
    _dateController.dispose();
    _customerNameController.dispose();
    _billingAddressController.dispose();
    _serviceAddressController.dispose();
    _pestCoverageController.dispose();
    _serviceTypeController.dispose();
    _frequencyController.dispose();
    _techniciansController.dispose();
    _treatmentMethodController.dispose();
    _pesticideUsedController.dispose();
    _technicianRemarksController.dispose();
    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                _buildHeader(),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'SERVICE REPORT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildField('REPORT NO.', _reportNoController),
                const SizedBox(height: 12),
                _buildField('DATE', _dateController),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'CUSTOMER INFORMATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildField('CUSTOMER NAME', _customerNameController),
                const SizedBox(height: 12),
                _buildField(
                  'BILLING ADDRESS',
                  _billingAddressController,
                ),
                const SizedBox(height: 12),
                _buildField(
                  'SERVICE ADDRESS',
                  _serviceAddressController,
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'REPORT DETAILS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildField(
                  'PEST COVERAGE',
                  _pestCoverageController,
                ),
                const SizedBox(height: 12),
                _buildField(
                  'SERVICE TYPE',
                  _serviceTypeController,
                ),
                const SizedBox(height: 12),
                _buildFieldRow('FREQUENCY', _frequencyController, 'TECHNICIAN(S)', _techniciansController),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'SERVICE DETAILS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildField(
                  'TREATMENT METHOD',
                  _treatmentMethodController,
                ),
                const SizedBox(height: 12),
                _buildField(
                  'PESTICIDE USED',
                  _pesticideUsedController,
                ),
                const SizedBox(height: 12),
                _buildField(
                  'TECHNICIAN REMARKS',
                  _technicianRemarksController,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: widget.onNext,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF1D2D4E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
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

  Widget _buildHeader() {
    return Column(
      children: [
        IconButton(
          onPressed: widget.onBack,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: const Color(0xFF1A1C2E),
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
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
            Text(
              'PESTIMESH',
              style: TextStyle(
                color: const Color(0xFF1A1C2E),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1A1C2E),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: const Color(0xFFE9EEF2),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          maxLines: null,
          style: const TextStyle(
            color: Color(0xFF1A1C2E),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildFieldRow(
    String label1,
    TextEditingController controller1,
    [String? label2, TextEditingController? controller2]
  ) {
    if (label2 == null || controller2 == null) {
      return _buildField(label1, controller1);
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label1,
                style: const TextStyle(
                  color: Color(0xFF1A1C2E),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller1,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFE9EEF2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                style: const TextStyle(
                  color: Color(0xFF1A1C2E),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label2,
                style: const TextStyle(
                  color: Color(0xFF1A1C2E),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFE9EEF2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                style: const TextStyle(
                  color: Color(0xFF1A1C2E),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
