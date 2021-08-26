import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ksc_prekin_lt_matsuri/models/likes.dart';
import 'package:ksc_prekin_lt_matsuri/screens/likes.dart';
import 'package:ksc_prekin_lt_matsuri/screens/home.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Likes>(
      create: (context) => Likes(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          LikesPage.routeName: (context) => LikesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
