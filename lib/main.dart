import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/display_news/presentation/provider.dart';
import 'package:news_app/features/display_news/presentation/ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                title: 'News App',
                theme: ThemeData(
                  appBarTheme: AppBarTheme(elevation: 0),
                  primarySwatch: Colors.green,
                ),
                home: ChangeNotifierProvider(
                  create: (context) => DisplayNewsProvider(),
                  builder: (context, child) => DisplayNewsUI(),
                ));
          }
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}