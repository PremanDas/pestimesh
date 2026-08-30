import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'drafts.dart';
import 'picture_reference_screen.dart';
import 'report_timestamp_screen.dart';
import 'service_report_form.dart';
import 'submissions.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({
    super.key,
    this.onNavigateToTab,
  });

  final void Function(int index)? onNavigateToTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  label: 'Submissions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubmissionsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  label: 'Create New',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateNewSubmissionFlow(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  label: 'Drafts',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DraftsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  label: 'History',
                  onTap: () {
                    onNavigateToTab?.call(2);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Color(0xff1800AD),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  'assets/icons/icon-right-arrow.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateNewSubmissionFlow extends StatefulWidget {
  const CreateNewSubmissionFlow({super.key});

  @override
  State<CreateNewSubmissionFlow> createState() => _CreateNewSubmissionFlowState();
}

class _CreateNewSubmissionFlowState extends State<CreateNewSubmissionFlow> {
  int _step = 0;
  final List<XFile?> _referenceImages = List<XFile?>.filled(4, null);
  XFile? _reportImage;

  void _goNext() {
    setState(() {
      if (_step < 2) {
        _step++;
      }
    });
  }

  void _goBack() {
    setState(() {
      if (_step > 0) {
        _step--;
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  void _updateReferenceImage(int index, XFile? image) {
    setState(() {
      _referenceImages[index] = image;
    });
  }

  void _updateReportImage(XFile? image) {
    setState(() {
      _reportImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case 0:
        return ServiceReportFormScreen(
          onNext: _goNext,
          onBack: _goBack,
        );
      case 1:
        return PictureReferenceScreen(
          onNext: _goNext,
          onBack: _goBack,
          selectedImages: _referenceImages,
          onImagePicked: _updateReferenceImage,
        );
      case 2:
        return ReportTimestampScreen(
          onBack: _goBack,
          selectedImage: _reportImage,
          onImageSelected: _updateReportImage,
        );
      default:
        return const SizedBox();
    }
  }
}
