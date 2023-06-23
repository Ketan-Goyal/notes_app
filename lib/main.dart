import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/firebase_options.dart';
import 'package:notes_app/Screens/login.dart';
import 'package:notes_app/models/firebaseHelper.dart';
import 'package:notes_app/models/userModel.dart';
import 'package:notes_app/pages/home.dart';
import 'package:notes_app/providers/Listprovider.dart';
import 'package:notes_app/providers/UserProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  LocalUser? currUser;
  User? user;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    print("found a user");
  } else {
    print("no user found");
  }
  runApp(MyApp(user: user));
}

class MyAppLoggedIn extends StatefulWidget {
  const MyAppLoggedIn({super.key});

  @override
  State<MyAppLoggedIn> createState() => _MyAppLoggedInState();
}

class _MyAppLoggedInState extends State<MyAppLoggedIn> {
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
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.deepPurple,
                  accentColor: Colors.deepPurpleAccent,
                  backgroundColor: Colors.white)
              .copyWith(secondary: Colors.deepPurpleAccent),
          useMaterial3: true,
        ),
        // home: const HomeScreen(),
        // home: LoginScreen()
        home: HomePage(),
      ),
    );
    ;
  }
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
        home: (widget.user == null) ? LoginScreen() : HomePage(),
        // HomePage(
        //     user: user!,
        //     currUser: currUser!,
        //   ),
      ),
    );
  }
}
