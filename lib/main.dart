import 'package:dictionary_flutter/packages/quote/quote.dart';
import 'package:flutter/material.dart';
import './pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Quotes().getAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}
