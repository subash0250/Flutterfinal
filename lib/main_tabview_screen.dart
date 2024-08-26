import 'package:flutter/material.dart';
import 'package:meditation_app_flutterfinalproject/color_extension.dart';
import 'package:meditation_app_flutterfinalproject/profile.dart';
import 'package:meditation_app_flutterfinalproject/tab_button.dart';
import 'package:meditation_app_flutterfinalproject/home_screen.dart';
import 'package:meditation_app_flutterfinalproject/meditate_screen.dart';
import 'package:meditation_app_flutterfinalproject/music_screen.dart';
import 'package:meditation_app_flutterfinalproject/sleep_screen.dart';

class MainTabViewScreen extends StatefulWidget {
  const MainTabViewScreen({super.key});

  @override
  State<MainTabViewScreen> createState() => _MainTabViewScreenState();
}

class _MainTabViewScreenState extends State<MainTabViewScreen> with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {
        selectTab = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded( // Use Expanded here
            child: TabBarView(
              controller: controller,
              children: [
                const HomeScreen(),
                const SleepScreen(),
                const MeditateScreen(),
                const MusicScreen(),
                const ProfileScreen(),
                Container(color: Colors.red), // Placeholder for profile tab
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 8),
        decoration: BoxDecoration(
          color: selectTab == 3 || selectTab == 1 ? TColor.sleep : Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -4)),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                title: "Home",
                isSelect: selectTab == 0,
                onPressed: () => changeTab(0),
              ),
              TabButton(
                icon: "assets/img/sleep_tab.png",
                title: "Sleep",
                isSelect: selectTab == 1,
                onPressed: () => changeTab(1),
              ),
              TabButton(
                icon: "assets/img/meditate_tab.png",
                title: "Meditate",
                isSelect: selectTab == 2,
                onPressed: () => changeTab(2),
              ),
              TabButton(
                icon: "assets/img/music_tab.png",
                title: "Music",
                isSelect: selectTab == 3,
                onPressed: () => changeTab(3),
              ),
              TabButton(
                icon: "assets/img/profile_tab.png",
                title: "profile",
                isSelect: selectTab == 4,
                onPressed: () => changeTab(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeTab(int index) {
    controller.animateTo(index);
  }
}
