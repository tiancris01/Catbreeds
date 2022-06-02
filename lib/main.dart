import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Presentation/Screen/detail_page.dart';
import 'Presentation/Screen/landing_page.dart';
import 'Presentation/Screen/splash_page.dart';
import 'Provider/cat_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CatService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const LandingPage(),
          '/datail': (context) => DitailPage(),
        },
      ),
    );
  }
}
