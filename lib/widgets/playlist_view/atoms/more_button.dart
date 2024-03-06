import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  void _showMoreModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(37, 37, 37, 1.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(IconlyLight.edit_square, color: Colors.white),
                  title: Text('Edit', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context); // Cierra la hoja modal
                    // Lógica para editar
                  },
                ),
                ListTile(
                  leading: Icon(IconlyLight.upload, color: Colors.white),
                  title: Text('Share', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context); // Cierra la hoja modal
                    // Lógica para compartir
                  },
                ),
                ListTile(
                  leading: Icon(IconlyLight.lock, color: Colors.white),
                  title: Text('Archive', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context); // Cierra la hoja modal
                    // Lógica para archivar
                  },
                ),
                ListTile(
                  leading: Icon(IconlyLight.delete, color: Colors.red),
                  title: Text('Remove', style: TextStyle(color: Colors.red)),
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
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showMoreModal(context),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 44,
            height: 44,
            color: Color.fromARGB(255, 189, 188, 188).withOpacity(0.1),
            child: Center(
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}