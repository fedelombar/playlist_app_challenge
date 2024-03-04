import 'package:flutter/material.dart';
import '../../../models/playlist.dart';
import '../../../navigators/app_navigator.dart'; // Asegúrate de importar AppNavigator si es necesario
import '../../../common/organisms/bottom_nav_bar/bottom_nav_bar.dart';

class PlaylistView extends StatelessWidget {
  final Playlist playlist;
  final AppNavigator appNavigator; // Pasar AppNavigator si es necesario

  const PlaylistView({Key? key, required this.playlist, required this.appNavigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlist.title ?? 'Playlist'),
      ),
      body: Center(
        child: Text(playlist.description ?? 'No description available'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1, // Asumiendo que quieres marcar como seleccionado un ítem diferente
        onItemTapped: (index) {
          // Implementa la lógica para manejar el cambio de ítem aquí
          // Esto puede incluir usar appNavigator para cambiar de pantalla
        },
        onCenterItemTapped: () {
          // Implementa lo que sucede cuando se toca el ítem central, si es aplicable
        },
        appNavigator: appNavigator, // Asegúrate de pasar appNavigator si es necesario
      ),
    );
  }
}
