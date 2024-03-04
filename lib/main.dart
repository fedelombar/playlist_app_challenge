import 'package:flutter/material.dart';
import 'package:playlist_app/screens/home_screen.dart';
import 'navigators/app_navigator.dart';
import 'theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppNavigator appNavigator = AppNavigator();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appNavigator.navigatorKey,
      onGenerateRoute: _generateRoute,
      theme: CustomTheme.darkTheme, //we choose dark theme, but if we want to use light theme, we can use lightTheme: CustomTheme.lightTheme apply under this.
      home:  HomeScreen(appNavigator: appNavigator),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen(appNavigator: appNavigator),);

      default:
      // Return a default page if no other route matches.
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}
