import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String? _selectedGender;
  bool _agreeTerms = false;

  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.blue, Colors.blue.shade50],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Registration Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(hint: 'Username'),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Full name'),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Country'),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Email', keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Phone number', keyboardType: TextInputType.phone),
                  const SizedBox(height: 16),
                  _buildGenderSelection(),
                  const SizedBox(height: 16),
                  _buildDateOfBirth(),
                  const SizedBox(height: 16),
                  _buildTextField(hint: 'Password', isPassword: true),
                  const SizedBox(height: 16),
                  _buildTermsAndConditions(),
                  const SizedBox(height: 24),
                  _buildCreateAccountButton(context),
                  const SizedBox(height: 20),
                  _buildLoginLink(context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      children: [
        const Text(
          'Gender',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
        const SizedBox(width: 16),
        _buildGenderButton('Male'),
        const SizedBox(width: 8),
        _buildGenderButton('Female'),
      ],
    );
  }

  Widget _buildGenderButton(String gender) {
    bool isSelected = _selectedGender == gender;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.blue.shade300,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
      child: Text(gender),
    );
  }

  Widget _buildDateOfBirth() {
    return Row(
      children: [
        const Text(
          'Date of birth',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
        const SizedBox(width: 16),
        _buildDateField(_monthController, 'MM'),
        const SizedBox(width: 8),
        _buildDateField(_dayController, 'DD'),
        const SizedBox(width: 8),
        _buildDateField(_yearController, 'YYYY', width: 70),
      ],
    );
  }

  Widget _buildDateField(TextEditingController controller, String hint, {double width = 50}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        Checkbox(
          value: _agreeTerms,
          onChanged: (value) {
            setState(() {
              _agreeTerms = value ?? false;
            });
          },
          fillColor: MaterialStateProperty.all(Colors.blue),
        ),
        const Text(
          'Agree with Terms & Conditions',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Create account',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          'Already have an account?',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}