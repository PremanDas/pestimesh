import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureReferenceScreen extends StatefulWidget {
  const PictureReferenceScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.selectedImages,
    required this.onImagePicked,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;
  final List<XFile?> selectedImages;
  final void Function(int index, XFile? image) onImagePicked;

  @override
  State<PictureReferenceScreen> createState() => _PictureReferenceScreenState();
}

class _PictureReferenceScreenState extends State<PictureReferenceScreen> {
  late final List<TextEditingController> _descriptionControllers;
  late final List<XFile?> _selectedImages;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _descriptionControllers = List.generate(
      4,
      (index) => TextEditingController(),
    );
    _selectedImages = List<XFile?>.from(widget.selectedImages);
  }

  Future<void> _pickImage(int index) async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (!mounted || pickedFile == null) {
      return;
    }

    setState(() {
      _selectedImages[index] = pickedFile;
    });
    widget.onImagePicked(index, pickedFile);
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
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: widget.onBack,
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: const Color(0xFF1A1C2E),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'P',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'PESTIMESH',
                      style: TextStyle(
                        color: Color(0xFF1A1C2E),
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D2D4E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'PICTURE REFERENCE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: List.generate(4, (index) {
                    return _buildUploadCard(index);
                  }),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: widget.onNext,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF1D2D4E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadCard(int index) {
    final selectedImage = _selectedImages[index];

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (selectedImage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                selectedImage.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF1A1C2E),
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          SizedBox(
            height: 72,
            child: InkWell(
              onTap: () => _pickImage(index),
              borderRadius: BorderRadius.circular(10),
              child: selectedImage == null
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 20,
                            color: Color(0xFF818BA1),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Upload',
                            style: TextStyle(
                              color: Color(0xFF818BA1),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(selectedImage.path),
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 72,
            child: TextField(
              controller: _descriptionControllers[index],
              decoration: InputDecoration(
                fillColor: const Color(0xFFE9EEF2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                hintText: 'Notes',
                hintStyle: const TextStyle(
                  color: Color(0xFF8E93A3),
                  fontSize: 8,
                ),
              ),
              style: const TextStyle(
                color: Color(0xFF8E93A3),
                fontSize: 8,
              ),
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
            ),
          ),
        ],
      ),
    );
  }
}
