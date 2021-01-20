import 'package:flutter/material.dart';
import 'pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Cultura Paraense',
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.redAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.redAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      routes: {
        HomePage.routeName: (BuildContext context) {
          return const HomePage();
        },
        LoadingPage.routeName: (BuildContext context) {
          return const LoadingPage();
        }
      },
      initialRoute: LoadingPage.routeName,
    );
  }
}
