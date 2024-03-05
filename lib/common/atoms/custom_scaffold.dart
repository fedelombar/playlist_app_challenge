import 'package:flutter/material.dart';

import '../../widgets/playlist_view/atoms/back_button.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool showBackButton;
  final Widget? bottomNavigationBar; // Añadir este parámetro

  const CustomScaffold({
    Key? key,
    required this.body,
    this.showBackButton = true,
    this.bottomNavigationBar, // Añadir esto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBackButton && Navigator.canPop(context)
          ? AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
          : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar, // Usar el parámetro aquí
    );
  }
}
