import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart'; // Import Firebase Database
import 'package:meditation_app_flutterfinalproject/color_extension.dart';
import 'package:meditation_app_flutterfinalproject/login_screen.dart';
import 'package:meditation_app_flutterfinalproject/round_button.dart';
import 'package:meditation_app_flutterfinalproject/round_text_feild.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    bool isValid = true;

    if (_usernameController.text.isEmpty) {
      isValid = false;
    }
    if (_emailController.text.isEmpty) {
      isValid = false;
    }
    if (_passwordController.text.isEmpty) {
      isValid = false;
    }
    if (_phoneController.text.isEmpty) {
      isValid = false;
    }
    if (_addressController.text.isEmpty) {
      isValid = false;
    }
    if (_selectedGender == null) {
      isValid = false;
    }

    return isValid;
  }

  Future<void> _registerUser() async {
    final DatabaseReference database = FirebaseDatabase.instance.ref();
    String userId = _emailController.text;

    // Create a map with user data
    Map<String, dynamic> userData = {
      'username': _usernameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'phone': _phoneController.text,
      'address': _addressController.text,
      'gender': _selectedGender,
    };


    await database.child('users').child(userId).set(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  "assets/img/login_top.png",
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/img/back.png",
                              width: 55,
                              height: 55,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Create your account",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          RoundTextField(
                            hintText: "Username",
                            controller: _usernameController,
                          ),
                          const SizedBox(height: 20),
                          RoundTextField(
                            hintText: "Email address",
                            controller: _emailController,
                          ),
                          const SizedBox(height: 20),
                          RoundTextField(
                            hintText: "Password",
                            obscureText: true,
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 8),
                          RoundTextField(
                            hintText: "Phone number",
                            controller: _phoneController,
                          ),
                          const SizedBox(height: 20),
                          RoundTextField(
                            hintText: "Address",
                            controller: _addressController,
                          ),
                          const SizedBox(height: 20),

                          // Gender selection
                          DropdownButtonFormField<String>(
                            value: _selectedGender,
                            hint: const Text("Select Gender"),
                            items: ['Male', 'Female', 'Other']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedGender = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: RoundButton(
                            title: "Sign UP",
                            onPressed: () async {
                              if (_validateFields()) {
                                await _registerUser();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              } else {

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'All feilds are mandatary'),
                                  ),
                                );
                              }
                            },
                          ),
                      ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Facebook button
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 50,
                            height: 50,
                            elevation: 0,
                            color: const Color(0xff8E97FD),
                            shape: const CircleBorder(),
                            child: Image.asset(
                              'assets/img/fb.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),

                        // Google button
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 50,
                            height: 50,
                            elevation: 0,
                            color: Colors.white,
                            shape: const CircleBorder(),
                            child: Image.asset(
                              'assets/img/google.png',
                              width: 24, // Adjusted icon size
                              height: 24, // Adjusted icon size
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
