import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alquran/screens/splash_screen.dart';
import 'package:alquran/screens/login_screen.dart';
import 'package:alquran/screens/home_screen.dart';
import 'package:alquran/globals.dart';
import 'package:alquran/services/auth_service.dart';
import 'package:alquran/services/daily_verse_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Quran App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primary,
        scaffoldBackgroundColor: background,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(color: Colors.white),
          bodyMedium: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: AuthService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return snapshot.data == true ? const HomeScreen() : const LoginScreen();
          }
        },
      ),
    );
  }
}