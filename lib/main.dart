//import 'package:ai_grammer_app/view/chat_screen.dart';
import 'package:ai_grammer_app/controller/gemini_api_controller.dart';
import 'package:ai_grammer_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return GeminiApiController(); //Controller Register
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
