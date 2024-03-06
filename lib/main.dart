import 'package:flutter/material.dart';
import 'package:playlist_app/screens/home_screen.dart';
import 'package:playlist_app/screens/playlist_view.dart';
import 'models/playlist.dart';
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
      debugShowCheckedModeBanner: false,
      navigatorKey: appNavigator.navigatorKey,
      onGenerateRoute: _generateRoute,
      theme: CustomTheme.darkTheme, // we choose dark theme, but if we want to use light theme, we can use lightTheme: CustomTheme.lightTheme.
      home:  HomeScreen(appNavigator: appNavigator),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen(appNavigator: appNavigator));
      case '/playlistView':
        final playlist = settings.arguments as Playlist;
        return MaterialPageRoute(
          builder: (context) => PlaylistView(playlist: playlist, appNavigator: appNavigator),
        );
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}