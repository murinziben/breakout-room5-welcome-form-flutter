import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Back Form',
      home: const WelcomeForm(),
    );
  }
}

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  State<WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String _sex = 'Male';
  bool _machineLearning = false;
  bool _fullStack = false;
  bool _mobileApplication = false;
  double _tuition = 50;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Submitted successful 😅😅😅'),
        ),
      );
    }
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _usernameController.clear();
    _passwordController.clear();
    setState(() {
      _sex = 'Male';
      _machineLearning = false;
      _fullStack = false;
      _mobileApplication = false;
      _tuition = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome Back!!!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Username field
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Username must be 10 char long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password field with visibility toggle
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'password must be 8 char long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Sex - Radio buttons
              const Text('Sex', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: _sex,
                      onChanged: (value) {
                        setState(() {
                          _sex = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: _sex,
                      onChanged: (value) {
                        setState(() {
                          _sex = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Courses - Checkboxes
              const Text('Courses', style: TextStyle(fontWeight: FontWeight.bold)),
              CheckboxListTile(
                title: const Text('Machine Learning'),
                value: _machineLearning,
                onChanged: (value) {
                  setState(() {
                    _machineLearning = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Full stack'),
                value: _fullStack,
                onChanged: (value) {
                  setState(() {
                    _fullStack = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Mobile application'),
                value: _mobileApplication,
                onChanged: (value) {
                  setState(() {
                    _mobileApplication = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Tuition - Slider
              const Text('Tuition', style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: _tuition,
                min: 0,
                max: 100,
                divisions: 100,
                label: _tuition.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _tuition = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Submit and Clear buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[100],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _clearForm,
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}