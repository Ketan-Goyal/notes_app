import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/firebase_options.dart';
import 'package:notes_app/Screens/login.dart';
import 'package:notes_app/pages/home.dart';
import 'package:notes_app/providers/Listprovider.dart';
import 'package:notes_app/providers/UserProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  User? user;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    if (kDebugMode) {
      print("found a user");
    }
  } else {
    if (kDebugMode) {
      print("no user found");
    }
  }
  runApp(MyApp(user: user));
}

class MyApp extends StatefulWidget {
  final User? user;
  const MyApp({super.key, required this.user});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        // home: const HomeScreen(),
        home: (widget.user == null) ? const LoginScreen() : const HomePage(),
        // HomePage(
        //     user: user!,
        //     currUser: currUser!,
        //   ),
      ),
    );
  }
}
