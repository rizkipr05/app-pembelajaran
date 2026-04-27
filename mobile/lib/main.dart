import 'package:flutter/material.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  fvp.registerWith();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ardata Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7000FF)),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
