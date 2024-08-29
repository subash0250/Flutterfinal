import 'package:flutter/material.dart';
import 'package:meditation_app_flutterfinalproject/choose_topic_screen.dart';
import 'package:meditation_app_flutterfinalproject/color_extension.dart';
import 'package:meditation_app_flutterfinalproject/login_screen.dart';
import 'package:meditation_app_flutterfinalproject/sign_up_screen.dart';
import 'package:meditation_app_flutterfinalproject/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meditation_app_flutterfinalproject/topic_provider.dart';
import 'package:meditation_app_flutterfinalproject/weather_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => TopicProvider(),
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Meditation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "HelveticaNeue",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'LoginPage': (context) => LoginScreen(),
        'choosetopic': (context) => ChooseTopicScreen(),
        'weather': (context) => WeatherScreen(),

      },
    );
  }
}
