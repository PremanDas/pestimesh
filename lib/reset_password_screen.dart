import 'package:flutter/material.dart';

String? currentPasswordValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Invalid password';
  }
  return null;
}

String? newPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8) {
    return 'Use at least 8 characters';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String newPassword) {
  if (value == null || value.isEmpty || value != newPassword) {
    return 'Does not match';
  }
  return null;
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isSuccessful = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    FocusScope.of(context).unfocus();
    setState(() => _isSuccessful = false);
    if (_formKey.currentState!.validate()) {
      setState(() => _isSuccessful = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(34, 14, 34, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: const Color(0xff1800AD),
                  iconSize: 25,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Color(0xff171765),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 29),
                _buildPasswordField(
                  label: 'Enter old password',
                  controller: _currentPasswordController,
                  validator: currentPasswordValidator,
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  label: 'Create new password',
                  controller: _newPasswordController,
                  validator: newPasswordValidator,
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  label: 'Confirm new password',
                  controller: _confirmPasswordController,
                  validator: (value) => confirmPasswordValidator(
                    value,
                    _newPasswordController.text,
                  ),
                ),
                const SizedBox(height: 28),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_isSuccessful)
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            '*Successful',
                            style: TextStyle(
                              color: Color(0xff00a66a),
                              fontSize: 9,
                            ),
                          ),
                        ),
                      IconButton(
                        onPressed: _resetPassword,
                        tooltip: 'Reset password',
                        icon: const Icon(Icons.arrow_forward_rounded),
                        color: Colors.white,
                        iconSize: 22,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          width: 24,
                          height: 24,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xff1800AD),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: validator,
      style: const TextStyle(fontSize: 10, color: Colors.grey),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // hintText: '[value]',
        hintStyle: const TextStyle(fontSize: 9, color: Colors.grey),
        prefixIcon: const Icon(Icons.lock, size: 14, color: Colors.grey),
        prefixIconConstraints: const BoxConstraints(minWidth: 34),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        errorStyle: const TextStyle(fontSize: 9, color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xff1800AD)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
