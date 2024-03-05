import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(IconlyLight.arrow_left_2, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
