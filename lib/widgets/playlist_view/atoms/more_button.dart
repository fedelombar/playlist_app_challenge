import 'dart:ui';

import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

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
            child: const Center(
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
