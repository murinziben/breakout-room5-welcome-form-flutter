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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5A0),
          secondary: Color(0xFF00E5A0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1E1E1E),
          labelStyle: const TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00E5A0), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
          ),
        ),
      ),
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

  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
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
    _firstNameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF00E5A0),
          content: const Text(
            'Submitted successful 😅😅😅',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _firstNameController.clear();
    _emailController.clear();
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

  InputDecoration _decoration(String label) {
    return InputDecoration(labelText: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Back!!!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // First Name
              TextFormField(
                controller: _firstNameController,
                style: const TextStyle(color: Colors.white),
                decoration: _decoration('First Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'First name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: _decoration('Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Username
              TextFormField(
                controller: _usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: _decoration('Username'),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Username must be 10 char long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF00E5A0),
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
              const SizedBox(height: 20),

              // Sex
              const Text('Sex',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5A0),
                      fontSize: 16)),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Male', style: TextStyle(color: Colors.white)),
                        activeColor: const Color(0xFF00E5A0),
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
                        title: const Text('Female', style: TextStyle(color: Colors.white)),
                        activeColor: const Color(0xFF00E5A0),
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
              ),
              const SizedBox(height: 16),

              // Courses
              const Text('Courses',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5A0),
                      fontSize: 16)),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Machine Learning', style: TextStyle(color: Colors.white)),
                      activeColor: const Color(0xFF00E5A0),
                      value: _machineLearning,
                      onChanged: (value) {
                        setState(() {
                          _machineLearning = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Full stack', style: TextStyle(color: Colors.white)),
                      activeColor: const Color(0xFF00E5A0),
                      value: _fullStack,
                      onChanged: (value) {
                        setState(() {
                          _fullStack = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Mobile application', style: TextStyle(color: Colors.white)),
                      activeColor: const Color(0xFF00E5A0),
                      value: _mobileApplication,
                      onChanged: (value) {
                        setState(() {
                          _mobileApplication = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tuition
              const Text('Tuition',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5A0),
                      fontSize: 16)),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFF00E5A0),
                  thumbColor: const Color(0xFF00E5A0),
                  inactiveTrackColor: Colors.white24,
                ),
                child: Slider(
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
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00E5A0),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _submitForm,
                        child: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2A2A2A),
                          foregroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Colors.redAccent),
                          ),
                        ),
                        onPressed: _clearForm,
                        child: const Text('Clear', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
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