import 'package:flutter/material.dart';
import 'package:word_translator/registor_screen.dart';
import 'package:word_translator/support_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'offer_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const RegistrationForm(),
        '/home': (context) => const HomeScreen(),
        '/offer_details': (context) => const OfferDetailsScreen(),
        '/support_chat': (context) => const SupportChatScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}