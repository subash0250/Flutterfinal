import 'package:flutter/material.dart';
import 'package:meditation_app_flutterfinalproject/color_extension.dart';
import 'package:meditation_app_flutterfinalproject/round_button.dart';
import 'package:meditation_app_flutterfinalproject/round_text_feild.dart';
import 'package:meditation_app_flutterfinalproject/welcome_screen.dart';
import 'package:meditation_app_flutterfinalproject/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  width: double.infinity,
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
                              Navigator.pop(context); // Use Navigator.pop()
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
                      "Welcome Back!",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "OR LOG IN WITH EMAIL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 35),
                    RoundTextField(hintText: "Email address"),
                    const SizedBox(height: 20),
                    RoundTextField(
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    // Smaller login button
                    SizedBox(
                      width: 200, // Set a specific width for the button
                      child: RoundButton(
                        title: "LOG IN",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 35), // Space before social buttons
                  ],
                ),
              ],
            ),
            const SizedBox(height: 35), // Added spacing before social buttons
            Text(
              "OR CONTINUE WITH",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Facebook Button
                MaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  color: const Color(0xff8E97FD), // Facebook color
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/img/fb.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 20),
                // Google Button
                MaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/img/google.png',
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Added spacing for better layout
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CREATE A NEW ACCOUNT?",
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
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Added spacing for better layout
          ],
        ),
      ),
    );
  }
}
