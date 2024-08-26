import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app_flutterfinalproject/color_extension.dart';
import 'package:meditation_app_flutterfinalproject/round_button.dart';
import 'package:meditation_app_flutterfinalproject/round_text_feild.dart';
import 'package:meditation_app_flutterfinalproject/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            RoundTextField(
                              hintText: "Email address",
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email address is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            RoundTextField(
                              hintText: "Password",
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            RoundTextField(
                              hintText: "Phone number",
                              controller: _phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            RoundTextField(
                              hintText: "Address",
                              controller: _addressController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Address is required';
                                }
                                return null;
                              },
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Gender is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            RoundButton(
                              title: "GET STARTED",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const WelcomeScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),

                      // Row for Facebook and Google buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Facebook button
                          Padding(
                            padding: const EdgeInsets.only(right: 10), // Spacing between buttons
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 50, // Set a minimum width for small round button
                              height: 50, // Set a small height for round button
                              elevation: 0,
                              color: const Color(0xff8E97FD),
                              shape: const CircleBorder(), // Make it circular
                              child: Image.asset(
                                'assets/img/fb.png',
                                width: 24, // Adjusted icon size
                                height: 24, // Adjusted icon size
                              ),
                            ),
                          ),

                          // Google button
                          Padding(
                            padding: const EdgeInsets.only(left: 10), // Spacing between buttons
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 50, // Set a minimum width for small round button
                              height: 50, // Set a small height for round button
                              elevation: 0,
                              color: Colors.white,
                              shape: const CircleBorder(), // Make it circular
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
                    ],
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
