import 'package:flutter/material.dart';
import 'package:meditation_app_flutterfinalproject/color_extension.dart';
import 'package:meditation_app_flutterfinalproject/login_screen.dart';
import 'package:meditation_app_flutterfinalproject/round_button.dart';
import 'package:meditation_app_flutterfinalproject/round_text_feild.dart';
import 'package:meditation_app_flutterfinalproject/welcome_screen.dart';

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
      // Highlight error by showing a dialog or using setState to show error message below the field
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
                        width: 200,
                        child: RoundButton(
                            title: "GET STARTED",
                            onPressed: () {
                              if (_validateFields()) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const WelcomeScreen(),
                                  ),
                                );
                              } else {
                                // You can show a Snackbar or Dialog to indicate there are empty fields
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please fill in all fields before proceeding.'),
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

                    // Row for Facebook and Google buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Facebook button
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10), // Spacing between buttons
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 50, // Set a minimum width for small round button
                            height: 50, // Set a small height for round button
                            elevation: 0,
                            color: const Color(0xff8E97FD),
                            shape:
                            const CircleBorder(), // Make it circular
                            child: Image.asset(
                              'assets/img/fb.png',
                              width: 24, // Adjusted icon size
                              height: 24, // Adjusted icon size
                            ),
                          ),
                        ),

                        // Google button
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10), // Spacing between buttons
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 50, // Set a minimum width for small round button
                            height: 50, // Set a small height for round button
                            elevation: 0,
                            color: Colors.white,
                            shape:
                            const CircleBorder(), // Make it circular
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
                          "Already had an Account?",
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
                            "Login",
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
