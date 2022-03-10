import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mool/shared/shared_prefs.dart';
import 'package:mool/ui/home.dart';
import 'package:mool/ui/login.dart';
import 'package:mool/ui/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mool",
      theme: ThemeData(
        fontFamily: "Metropolis",
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff00bf56),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}
