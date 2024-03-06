import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ModalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(IconlyLight.more_circle),
      color: Colors.white,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(37, 37, 37, 1.0),
                // Ajusta el color de fondo como sea necesario
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // Asegúrate de que el contenido no llene toda la pantalla
                  children: <Widget>[
                    ListTile(
                      leading:
                          Icon(IconlyLight.edit_square, color: Colors.white),
                      title:
                          Text('Edit', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context); // Cierra la hoja modal
                        // Lógica para editar
                      },
                    ),
                    ListTile(
                      leading: Icon(IconlyLight.upload, color: Colors.white),
                      title:
                          Text('Share', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context); // Cierra la hoja modal
                        // Lógica para compartir
                      },
                    ),
                    ListTile(
                      leading: Icon(IconlyLight.archive, color: Colors.white),
                      title: Text('Archive',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context); // Cierra la hoja modal
                        // Lógica para archivar
                      },
                    ),
                    ListTile(
                      leading: Icon(IconlyLight.delete, color: Colors.red),
                      title:
                          Text('Remove', style: TextStyle(color: Colors.red)),
                      onTap: () {
                        Navigator.pop(context); // Cierra la hoja modal
                        // Lógica para eliminar
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
