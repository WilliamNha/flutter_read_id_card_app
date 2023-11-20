import 'package:flutter/material.dart';
import 'package:flutter_read_id_card_app/provider/id_card_provider.dart';
import 'package:flutter_read_id_card_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<IdCardProvider>(
                create: (context) => IdCardProvider()),
          ],
          child: const HomeScreen(),
        ));
  }
}
