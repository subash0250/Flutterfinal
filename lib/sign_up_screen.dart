import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation/common/color_extension.dart';
import 'package:meditation/common_widget/round_button.dart';
import 'package:meditation/common_widget/round_text_field.dart';
import 'package:meditation/screen/home/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isTrue = false;

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

                    // Login with Email section
                    Text(
                      "LOG IN WITH EMAIL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          RoundTextField(hintText: "Username"),
                          const SizedBox(height: 20),
                          RoundTextField(hintText: "Email address"),
                          const SizedBox(height: 20),
                          RoundTextField(
                            hintText: "Password",
                            obscureText: true,
                          ),
                          const SizedBox(height: 8),
                          RoundButton(
                            title: "GET STARTED",
                            height: 40, // Adjusted height for smaller button
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen(),
                                ),
                              );
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
                            shape: CircleBorder(), // Make it circular
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/fb.png',
                                  width: 24, // Adjusted icon size
                                  height: 24, // Adjusted icon size
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Google button
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 50, // Set a minimum width for small round button
                          height: 50, // Set a small height for round button
                          elevation: 0,
                          color: Colors.white,
                          shape: CircleBorder(), // Make it circular
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/google.png',
                                width: 24, // Adjusted icon size
                                height: 24, // Adjusted icon size
                              ),
                            ],
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
