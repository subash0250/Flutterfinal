import 'package:flutter/material.dart';
import 'package:meditation/common/color_extension.dart';
import 'package:meditation/common_widget/round_button.dart';
import 'package:meditation/screen/home/choose_topic_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8E97FD),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/img/welcome.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(
                      "assets/img/logo.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Hello Subash, Welcome",
                      style: TextStyle(
                        color: TColor.primaryTextW,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "to Silent Moon",
                      style: TextStyle(
                        color: TColor.primaryTextW,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Explore the app, Find some peace of mind to prepare for meditation.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.primaryTextW,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 50),
                    RoundButton(
                      title: "GET STARTED",
                      type: RoundButtonType.secondary,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChooseTopicScreen(),
                        ));
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
