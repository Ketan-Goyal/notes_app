import 'package:flutter/material.dart';
import 'package:notes_app/pages/home.dart';
import 'package:notes_app/providers/Listprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ListProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.deepPurple,
                  accentColor: Colors.deepPurpleAccent,
                  backgroundColor: Colors.white)
              .copyWith(secondary: Colors.deepPurpleAccent),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
