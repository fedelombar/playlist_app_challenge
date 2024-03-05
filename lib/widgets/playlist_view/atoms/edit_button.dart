import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
            color: const Color.fromARGB(255, 189, 188, 188).withOpacity(0.1),
            child: Image.asset("assets/icons/pen_icon.png")
          ),
        ),
      ),
    );
  }
}
